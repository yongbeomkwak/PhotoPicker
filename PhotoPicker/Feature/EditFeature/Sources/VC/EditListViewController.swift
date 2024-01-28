//
//  EditListViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit
import Combine

class EditListViewController: UIViewController {

    var viewModel: EditListViewModel!
    var input: EditListViewModel.Input!
    var output: EditListViewModel.Output!
    var subscription: Set<AnyCancellable> = .init()
    var cropComponent : CropComponent!
    
    public lazy var navigationBarView: NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "\(1)/\(self.viewModel.dataes.count)", mode: .edit)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    public var carouselLabel: UILabel =  {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .setColor(.primary)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .heavy, width: .standard)
        label.textColor = .white
        label.text = "1"
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 2
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.setColor(.primary).cgColor
        
        return label
        
    }()
    
    
    lazy var bottomContainerView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
    }()
    
    lazy var cropButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "crop"), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    var rotateButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.triangle.2.circlepath"), for: .normal)
        button.tintColor = .white
        
        
        
        return button
        
    }()
    
    let flowLayout : UICollectionViewFlowLayout = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    
    lazy var collectionView : UICollectionView = {
       
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        view.register(EditListCollectionViewCell.self, forCellWithReuseIdentifier: EditListCollectionViewCell.id)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        view.isPagingEnabled = true 
        
        return view
    }()
    
    
    init(viewModel: EditListViewModel, cropComponent: CropComponent) {
        self.viewModel = viewModel
        self.cropComponent = cropComponent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayout()
        bindInput()
        navigationBarView.changeCountLabel("\(viewModel.dataes.count)")
        
        
        
    }
    
}

extension EditListViewController {
    
    func addSubviews() {
        self.view.addSubviews(navigationBarView,bottomContainerView,collectionView,carouselLabel)
        bottomContainerView.addSubviews(cropButton,rotateButton)
        self.view.backgroundColor = .black
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        
        carouselLabel.setTop(anchor: self.navigationBarView.bottomAnchor, constant: 10)
        carouselLabel.setRight(anchor: self.view.rightAnchor, constant: 30)
        carouselLabel.setHeight(40)
        carouselLabel.setWidth(40)

        
        collectionView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        collectionView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        collectionView.setTop(anchor: self.navigationBarView.bottomAnchor, constant: 20)
        collectionView.setBottom(anchor: self.bottomContainerView.topAnchor, constant: 20)
        collectionView.dataSource = self
        collectionView.delegate = self
    
        
        bottomContainerView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        bottomContainerView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        bottomContainerView.setBottom(anchor: self.view.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        
        bottomContainerView.setHeight(70)
        
        cropButton.setWidth(50)
        cropButton.setHeight(50)
       
        
        cropButton.setCenter(view: self.bottomContainerView, offset: .init(x: -50, y: 0))
        
        rotateButton.setWidth(50)
        rotateButton.setHeight(50)
        
        rotateButton.setCenter(view: self.bottomContainerView, offset: .init(x: 50, y: 0))
//            
        
        
    }
    
    func bindInput() {

        input = EditListViewModel.Input(tapCrop: cropButton.tapPublisher, tapRotate: rotateButton.tapPublisher)
        
        bindOutput(input: input)
    }
    
    func bindOutput(input: EditListViewModel.Input) {
        
        output = viewModel.transform(input: input)
        
        output.selelctedData.sink { [weak self]data in
            
            guard let self else {return}
            
            let vc = cropComponent.cropFactory.makeViewController(data: data)
            
            vc.modalPresentationStyle = .fullScreen
            
            self.present(vc, animated: false)
            
            
        }
        .store(in: &subscription)
        
        
        output.rotate
            .dropFirst(1)
            .sink { [weak self] (index:Int) in
            
            guard let self else {return }
            
            viewModel.rotateState[index] = viewModel.rotateState[index].next()
                
                DEBUG_LOG(viewModel.rotateState)
            
                guard let  cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: .zero)) as? EditListCollectionViewCell else {
                    return
                }
                
                cell.rotate(viewModel.rotateState[index],index: index)
            
        }
        .store(in: &subscription)
    }
    
}


