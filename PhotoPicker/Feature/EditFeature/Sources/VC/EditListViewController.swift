//
//  EditListViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

class EditListViewController: UIViewController {

    var viewModel: EditListViewModel!
    
    public lazy var navigationBarView: NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "\(1)/\(self.viewModel.dataes.count)", mode: .edit)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .black
        view.isPagingEnabled = true 
        
        return view
    }()
    
    
    init(viewModel: EditListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setLayout()
        
        navigationBarView.changeCountLabel("\(viewModel.dataes.count)")
        
        
        
    }
    
}

extension EditListViewController {
    
    func addSubviews() {
        self.view.addSubviews(navigationBarView, collectionView ,bottomContainerView)
        bottomContainerView.addSubviews(cropButton,rotateButton)
        self.view.backgroundColor = .black
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        
        collectionView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        collectionView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        collectionView.setTop(anchor: self.navigationBarView.bottomAnchor, constant: 20)
        collectionView.setBottom(anchor: self.bottomContainerView.topAnchor, constant: 20)
        collectionView.setHeight(200)
        collectionView.dataSource = self
        collectionView.delegate = self
    
        
        bottomContainerView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        
        bottomContainerView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        
        bottomContainerView.setBottom(anchor: self.view.bottomAnchor, constant: .zero)
        
        bottomContainerView.setHeight(70)
        
        cropButton.setWidth(50)
        cropButton.setHeight(50)
        cropButton.setTop(anchor: self.bottomContainerView.topAnchor, constant: .zero)
        cropButton.setBottom(anchor: self.bottomContainerView.bottomAnchor, constant: .zero)
        
        cropButton.setCenter(view: self.bottomContainerView, offset: .init(x: -50, y: 0))
        
        rotateButton.setWidth(50)
        rotateButton.setHeight(50)
        rotateButton.setTop(anchor: self.bottomContainerView.topAnchor, constant: .zero)
        rotateButton.setBottom(anchor: self.bottomContainerView.bottomAnchor, constant: .zero)
        
        rotateButton.setCenter(view: self.bottomContainerView, offset: .init(x: 50, y: 0))
            
        
        
    }
    
}


