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
    fileprivate var input : HomeViewModel.Input!
    fileprivate var output: HomeViewModel.Output!
    
    private var subscription = Set<AnyCancellable>()
    
    
    
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


}

extension HomeViewController {
    
    func addSubview() {
        self.view.addSubviews(photoPickerButton)
    }
    
    func setLayout() {
        // 버튼의 레이아웃 설정.
        
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
            
            self.navigationController?.pushViewController(photoPickerComponent.photoPickerFactory.makeViewController(), animated: true)
            
        })
        .store(in: &subscription)
    }
    
}

