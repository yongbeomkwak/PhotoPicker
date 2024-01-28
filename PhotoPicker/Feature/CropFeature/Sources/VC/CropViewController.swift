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
        
        let image = UIImage(data: viewModel.data!)!
        
        let size = configureImageviewSize(image: image)
        let (width,height) = (size.width,size.height)
        
        
        cropPickerView.setWidth(width)
        cropPickerView.setHeight(height)
        cropPickerView.setCenterX(view: self.view)
        cropPickerView.setCenterY(view: self.view, constant: 24)
        
    }
    
    
    private func configureImageviewSize(image: UIImage) -> CGRect {
            // 이미지 원본 사이즈
            let imageWidth: CGFloat = image.size.width
            let imageHeight: CGFloat = image.size.height

            // 이미지 가로, 세로 최대 사이즈
            let maxContentWidth: CGFloat = APP_WIDTH()-40
            let maxContentHeight: CGFloat = APP_HEIGHT()-48-STATUS_BAR_HEGHIT()-SAFEAREA_BOTTOM_HEIGHT()-100
        
            DEBUG_LOG("TMP : \(maxContentHeight)")

            // 최종 사이즈
            var resultWidth: CGFloat = 0
            var resultHeight: CGFloat = 0

            // 이미지 사이즈에 맞게 보정
            if imageWidth > imageHeight { // 가로
                resultWidth = maxContentWidth
                resultHeight = (maxContentWidth * image.size.height) / image.size.width

            }else if imageWidth < imageHeight { // 세로
                resultWidth = (maxContentHeight * image.size.width) / image.size.height
                resultHeight = maxContentHeight

                if resultWidth > maxContentWidth {
                    resultWidth = maxContentWidth
                    resultHeight = (maxContentWidth * image.size.height) / image.size.width
                }

            }else { // 1:1
                resultWidth = maxContentWidth
                resultHeight = maxContentWidth
                
               
            }
        
            return CGRect(x: 0, y: 0, width: resultWidth, height: resultHeight)
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
    }
    
}
