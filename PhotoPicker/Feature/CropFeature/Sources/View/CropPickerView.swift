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
       imageView.contentMode = .scaleAspectFit
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
        self.imageView.image = image
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
    
    
        
        imageView.setLeft(anchor: self.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        
//        cropView.setLeft(anchor: imageView.leftAnchor, constant: -5)
//        cropView.setRight(anchor: imageView.rightAnchor, constant: -5)
//        cropView.setTop(anchor: imageView.topAnchor, constant: -5)
//        cropView.setBottom(anchor: imageView.bottomAnchor, constant: -5)
//
//        
//        leftTopButton.setTop(anchor: cropView.topAnchor, constant: -20)
//        leftTopButton.setLeft(anchor: cropView.leftAnchor, constant: -20)
        
//        leftBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -20)
//        leftBottomButton.setLeft(anchor: cropView.leftAnchor, constant: -20)
//        
//        rightTopButton.setTop(anchor: cropView.topAnchor, constant: -20)
//        rightTopButton.setRight(anchor: cropView.rightAnchor, constant: -20)
//        
//        rightBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -10)
//        rightBottomButton.setRight(anchor: cropView.rightAnchor, constant: -10)
        
        
    }
    


    
}
