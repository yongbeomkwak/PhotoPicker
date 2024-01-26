//
//  CropViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

class CropViewController: UIViewController {

    
    var viewModel: CropViewModel!
    
    
    var imageView: UIImageView = {
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFit
        
        
        return view
    }()
    
    var navigationBarView : NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "", mode: .cut)
       
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setLayout()
    }
    
    init(viewModel: CropViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}

extension CropViewController {
    
    func addSubviews() {
        self.view.addSubviews(imageView,navigationBarView)
        
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        
        imageView.setCenter(view: self.view, offset: .zero)
        
        imageView.setWidth(300)
        imageView.setHeight(300)
        imageView.backgroundColor = .red
        
        imageView.image = UIImage(data: self.viewModel.data ?? Data())!
        
    }
    
}

extension CropViewController : NavigationBarViewDelegate {
    func tapLeftButton() {
        self.dismiss(animated: false)
    }
    
    func tapRightButton() {
            // TODO: 완료
    }
    
}
