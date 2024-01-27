//
//  CropPickerView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/27/24.
//

import UIKit

class CropPickerView: UIView {

       
   public let imageView: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()
    
    public var leftTopButton: CircleButton = CircleButton()
    public var leftBottomButton: CircleButton = CircleButton()
    public var rightTopButton: CircleButton = CircleButton()
    public var rightBottomButton: CircleButton = CircleButton()
       
//       public let dimView: CropDimView = {
//           let view = CropDimView()
//           view.translatesAutoresizingMaskIntoConstraints = false
//           view.alpha = 1
//           return view
//       }()
    
       public let cropView: CropView = {
           let cropView = CropView()
           cropView.translatesAutoresizingMaskIntoConstraints = false
           return cropView
       }()
    
    private var cropLeadingConstraint: NSLayoutConstraint?
    
    private var cropTrailingConstraint: NSLayoutConstraint?
    
    private var cropTopConstraint: NSLayoutConstraint?
    
    private var cropBottomConstraint: NSLayoutConstraint?
    
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        self.imageView.image = image.fixOrientation
        addSubviews()
        setLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension CropPickerView {
    
    func addSubviews() {
        self.addSubviews(cropView,leftTopButton,leftBottomButton,rightTopButton,rightBottomButton,imageView)
    }
    
    func setLayout() {
    
        let imageSize = imageView.frameForImageInImageViewAspectFit
        
        
        DEBUG_LOG("HHH \(imageSize)")
     
        imageView.setWidth(300)
        imageView.setHeight(300)
        imageView.setCenterY(view: self)
        
        imageView.setLeft(anchor: self.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        
        cropView.setLeft(anchor: imageView.leftAnchor, constant: -10)
        cropView.setRight(anchor: imageView.rightAnchor, constant: -10)
        cropView.setTop(anchor: imageView.topAnchor, constant: -10)
        cropView.setBottom(anchor: imageView.bottomAnchor, constant: -10)
        
        
        leftTopButton.setTop(anchor: cropView.topAnchor, constant: -20)
        leftTopButton.setLeft(anchor: cropView.leftAnchor, constant: -20)
        
        leftBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -20)
        leftBottomButton.setLeft(anchor: cropView.leftAnchor, constant: -20)
        
        rightTopButton.setTop(anchor: cropView.topAnchor, constant: -20)
        rightTopButton.setRight(anchor: cropView.rightAnchor, constant: -20)
        
        rightBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -10)
        rightBottomButton.setRight(anchor: cropView.rightAnchor, constant: -10)
        
        
    }
    
    
    private func isImageRateHeightGreaterThan(_ imageSize: CGRect) -> Bool {
           let widthRate =  bounds.width / imageSize.width
           let heightRate = bounds.height / imageSize.height
           return widthRate < heightRate
    }
    
    
}
