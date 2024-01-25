//
//  PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

class PhotoPickerViewController: UIViewController {

    
    private let viewModel : PhotoPickerViewModel!
    fileprivate var input : PhotoPickerViewModel.Input!
    fileprivate var output: PhotoPickerViewModel.Output!
    
    
    private var navigationBarView: NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "최근 항목", mode: .photoPicker)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var bottomEditButtonContainerView : BottomEditButtonContainerView =  {
        
        let view = BottomEditButtonContainerView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    init(viewModel: PhotoPickerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
}

extension PhotoPickerViewController {
    
    func addSubviews() {
        self.view.addSubviews(navigationBarView,bottomEditButtonContainerView)
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        bottomEditButtonContainerView.setLeft(anchor: self.view.leftAnchor, constant:  .zero)
        bottomEditButtonContainerView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        bottomEditButtonContainerView.setBottom(anchor: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 50)
        bottomEditButtonContainerView.setHeight(50)
        
    }
    
    func bindInput() {
        input = PhotoPickerViewModel.Input()
        
        bindOutput(input: input)
    }
    
    func bindOutput(input: PhotoPickerViewModel.Input) {
        
        output = viewModel.transform(input: input)
        
    }
}
