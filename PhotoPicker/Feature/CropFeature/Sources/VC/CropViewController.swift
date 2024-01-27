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
       
        return view
    }()
    
    lazy var cropPickerView : CropPickerView = {
        
        
        let image = UIImage(data: viewModel.data!)!
        
        let view = CropPickerView(frame: .zero, image: image)
        
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
        
       
        cropPickerView.setCenterY(view: self.view)
        
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
