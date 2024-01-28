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
    
    public var leftTopButton: CircleButton = {
        
        let view = CircleButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    public var leftBottomButton: CircleButton = {
        
        let view = CircleButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    public var rightTopButton: CircleButton = {
        
        let view = CircleButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    public var rightBottomButton: CircleButton = {
        
        let view = CircleButton()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
       

    
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
        bindGesture()
     

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension CropPickerView {
    
    func addSubviews() {
        self.addSubviews(imageView,cropView)
        self.cropView.addSubviews(leftTopButton,leftBottomButton,rightTopButton,rightBottomButton)
    }
    
    func setLayout() {
    
        imageView.setLeft(anchor: self.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        
        cropView.setLeft(anchor: imageView.leftAnchor, constant: -4)
        cropView.setRight(anchor: imageView.rightAnchor, constant: -4)
        cropView.setTop(anchor: imageView.topAnchor, constant: -4)
        cropView.setBottom(anchor: imageView.bottomAnchor, constant: -4)
        
        leftTopButton.setTop(anchor: cropView.topAnchor, constant: -15)
        leftTopButton.setLeft(anchor: cropView.leftAnchor, constant: -15)
        
        leftBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -15)
        leftBottomButton.setLeft(anchor: cropView.leftAnchor, constant: -15)
        
        rightTopButton.setTop(anchor: cropView.topAnchor, constant: -15)
        rightTopButton.setRight(anchor: cropView.rightAnchor, constant: -15)
        
        rightBottomButton.setBottom(anchor: cropView.bottomAnchor, constant: -15)
        rightBottomButton.setRight(anchor: cropView.rightAnchor, constant: -15)
        
        
    }
    
    
    func bindGesture() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        cropView.addGestureRecognizer(panGesture)
        
        
    }
    



    
}
