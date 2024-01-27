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
    
    var controlView : ControlView =  {
        
        let view = ControlView(frame: .zero)
        
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
        self.view.addSubviews(imageView,navigationBarView,controlView)
        
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        
        imageView.setTop(anchor: navigationBarView.bottomAnchor, constant: 20)
        imageView.setCenter(view: self.view, offset: .zero)
        
        controlView.setTop(anchor: navigationBarView.bottomAnchor, constant: 20)
        controlView.setCenter(view: self.view, offset: .zero)
        
        let image = UIImage(data: self.viewModel.data ?? Data())!
        
        var width : CGFloat = .zero
        var height : CGFloat = .zero
        
        if image.size.height >= image.size.width {
            width = APP_WIDTH()-60
            height = width * image.getRatioHeightToWidth()
            
        } else {
            height = APP_WIDTH() - 60
            width =  height * image.getRatioWidthToHeight()
        }

        
        DEBUG_LOG("GOS \(image.size.width) \(image.size.height) \(image.getRatioHeightToWidth()) \(image.getRatioWidthToHeight()) \(width) \(height)")
        
        imageView.setWidth(width)
        imageView.setHeight(height)
        
        controlView.setWidth(width)
        controlView.setHeight(height)
        
        imageView.image = image
        
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
