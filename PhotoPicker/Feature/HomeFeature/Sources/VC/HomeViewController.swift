//
//  ViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    
    private let viewModel : HomeViewModel!
    private let photoPickerComponent: PhotoPickerComponent!
    var input : HomeViewModel.Input!
    var output: HomeViewModel.Output!
    
    private var subscription = Set<AnyCancellable>()
    
    
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
    
    
    
    var photoPickerButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = .setColor(.primary)
        button.setRound(.allCorners, radius: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(title: "사진 올리기", ofSize: 20,weight: .bold,textColor: .white)
        
        return button
        
    }()
    
    
    
    init(viewModel: HomeViewModel, photoPickerComponent: PhotoPickerComponent) {
        self.viewModel = viewModel
        self.photoPickerComponent = photoPickerComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommonUI()
        addSubview()
        setLayout()
        bindInput()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.collectionView.reloadData()
    }



}

extension HomeViewController {
    
    func addSubview() {
        self.view.addSubviews(photoPickerButton,collectionView)
    }
    
    func setLayout() {
        // 버튼의 레이아웃 설정.
        
        collectionView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        collectionView.setLeft(anchor: self.view.leftAnchor, constant: 0)
        
        collectionView.setRight(anchor: self.view.rightAnchor, constant: 0)
        
        collectionView.setBottom(anchor: photoPickerButton.topAnchor, constant: 20)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        photoPickerButton.setCenterX(view: self.view)
        photoPickerButton.setBottom(anchor: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 45)
        photoPickerButton.setLeft(anchor: self.view.safeAreaLayoutGuide.rightAnchor, constant: 20)
        photoPickerButton.setRight(anchor: self.view.safeAreaLayoutGuide.rightAnchor, constant: 20)
        photoPickerButton.setHeight(48)
    
   
        
    }
    
    func bindInput() {
        input = HomeViewModel.Input(tapNavigateButton: photoPickerButton.tapPublisher)
        
        bindOutput(input: input)
    }
    
    func bindOutput(input: HomeViewModel.Input) {
        output = viewModel.transform(input: input)
        
        
        output.navigateToPhotoPicker
            .sink(receiveValue: { [weak self ] in
            
            guard let self else {return}
            
                guard let vc = photoPickerComponent.photoPickerFactory.makeViewController() as? PhotoPickerViewController else {
                    return
                }
            
                vc.delegate = self
                
            self.navigationController?.pushViewController(vc, animated: true)
            
        })
        .store(in: &subscription)
        
        
        output.dataSource.sink { [weak self] data in
            
            guard let self else {return}
            
            
            self.collectionView.reloadData()
            
        }
        .store(in: &subscription)
    }
    
}

extension HomeViewController : PhotoPickerViewControllerDelegate {
    func complete(data: [Data?]) {
        input.fetchData.send(data)
    }
    
}
