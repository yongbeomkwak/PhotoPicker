//
//  CropViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

class CropViewController: UIViewController  {

    
    var viewModel: CropViewModel!
    

    var navigationBarView : NavigationBarView = {
        
        let view = NavigationBarView(frame: .zero, title: "", mode: .cut)
       
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cropPickerView : CropPickerView = {
        
        
        let image = UIImage(data: viewModel.data!)!
        let view = CropPickerView(frame: .zero, image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.view.addSubviews(navigationBarView,cropPickerView)
        
    }
    
    func setLayout() {
        
        navigationBarView.setLeft(anchor: self.view.leftAnchor, constant: .zero)
        navigationBarView.setRight(anchor: self.view.rightAnchor, constant: .zero)
        navigationBarView.setTop(anchor: self.view.safeAreaLayoutGuide.topAnchor, constant: 0)
        navigationBarView.setHeight(48)
        navigationBarView.deleagte = self
        
        let image = UIImage(data: viewModel.data ?? .init()) ?? .init()

        let size = image.configureImageviewSize()
        let (width,height) = (size.width,size.height)
        
        
        cropPickerView.setWidth(width)
        cropPickerView.setHeight(height)
        cropPickerView.setCenterX(view: self.view)
        cropPickerView.setCenterY(view: self.view, constant: 24)
        
    }
    

}

extension CropViewController : NavigationBarViewDelegate {
    func tapCenterButton() {
        
    }
    
    func tapLeftButton() {
        self.dismiss(animated: false)
    }
    
    func tapRightButton() {
            // TODO: 완료
        self.dismiss(animated: false)
    }
    
}
