//
//  ViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    
    private let viewModel: HomeViewModel!
    fileprivate lazy var input = HomeViewModel.In
    
    private var subscription = Set<AnyCancellable>()
    
    
    var photoPickerButton: UIButton = {
        
        let button = UIButton()
        let label = UILabel()
        
        button.backgroundColor = .setColor(.primary)
        button.setRound(.allCorners, radius: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(title: "사진 올리기", ofSize: 20,weight: .bold)
        
        return button
        
    }()
    
    
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
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
    
    func bindEvent() {
        
    }
    
}

