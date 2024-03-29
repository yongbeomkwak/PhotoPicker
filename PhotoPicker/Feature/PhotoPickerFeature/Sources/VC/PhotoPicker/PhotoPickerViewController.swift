//
//  PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit
import Combine
import Photos


protocol PhotoPickerViewControllerDelegate : AnyObject {
    func complete(data: [Data?])
}


class PhotoPickerViewController: UIViewController{
    
    weak var delegate: PhotoPickerViewControllerDelegate?
    
    let editListComponent: EditListComponent
    private let viewModel : PhotoPickerViewModel!
    public var input : PhotoPickerViewModel.Input!
    public var output: PhotoPickerViewModel.Output!
    var subscription: Set<AnyCancellable> = .init()
    
     var navigationBarView: NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "최근 항목", mode: .photoPicker)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var bottomEditButtonContainerView : BottomEditButtonContainerView =  {
        
        let view = BottomEditButtonContainerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    let gridFlowLayout: GridCollectionViewFlowLayout = {
        let layout = GridCollectionViewFlowLayout()
        layout.cellSpacing = 3
        layout.numberOfColumns = 3
        return layout
        
    }()
    
    lazy var collectionView : UICollectionView =  {
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.gridFlowLayout)
        
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .setColor(.bg)
        view.clipsToBounds = true
        view.register(PhotoPickerCollectionViewCell.self, forCellWithReuseIdentifier: PhotoPickerCollectionViewCell.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    } ()
    
    init(viewModel: PhotoPickerViewModel,editListComponent: EditListComponent) {
        self.viewModel = viewModel
        self.editListComponent = editListComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        PHPhotoLibrary.shared().unregisterChangeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCommonUI()
        addSubviews()
        setLayout()
        bindInput()
        requestPhotoLibraryPermission()
        PHPhotoLibrary.shared().register(self)
        
        let vc = AlbumPickerVIewController()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    
    
}

extension PhotoPickerViewController {
    
    func addSubviews() {
        self.view.addSubviews(navigationBarView,bottomEditButtonContainerView,collectionView)
        
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
  
        
        bottomEditButtonContainerView.setLeft(anchor: self.view.leftAnchor, constant:  .zero)
        bottomEditButtonContainerView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        bottomEditButtonContainerView.setBottom(anchor: self.view.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        bottomEditButtonContainerView.setHeight(50)
        
        collectionView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        collectionView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        collectionView.setTop(anchor: self.navigationBarView.bottomAnchor, constant: .zero)
        collectionView.setBottom(anchor: self.bottomEditButtonContainerView.topAnchor, constant: .zero)
        

        bottomEditButtonContainerView.delegate = self
        navigationBarView.deleagte = self
        collectionView.dataSource = self
        collectionView.delegate = self

    }
    
    
    func bindInput() {
        input = PhotoPickerViewModel.Input()
        
        bindOutput(input: input)
    }
    
    func bindOutput(input: PhotoPickerViewModel.Input) {
        
        output = viewModel.transform(input: input)
        
        
        output.dataSource
            .sink { [weak self] data in
            guard let self else {return}
        
                
            self.collectionView.reloadData()
        }
        .store(in: &subscription)
        
        
        
        output.selectedItems
            .sink(receiveValue: { [weak self] data in
               
                guard let self else {return}
                
                self.bottomEditButtonContainerView.changeAbleState(!data.isEmpty)

                self.navigationBarView.changeCountLabel(data.isEmpty ? "" : "\(data.count)")
                
                self.navigationBarView.changeAbleState(!data.isEmpty)
               
                
                
            })
            .store(in: &subscription)
      
    }
}


