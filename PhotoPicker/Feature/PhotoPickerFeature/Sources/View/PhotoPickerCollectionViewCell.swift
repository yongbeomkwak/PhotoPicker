//
//  PhotoPickerCollectionViewCell.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import UIKit

class PhotoPickerCollectionViewCell: UICollectionViewCell {
    static let id : String = "PhotoPickerCollectionViewCell"
    
    var imageView: UIImageView = {
        
        let imageView = UIImageView()
       
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    var cameraImageView: UIImageView = {
        
        let img = UIImage(systemName: "camera.fill")!.withRenderingMode(.alwaysTemplate)
        
        let imageView = UIImageView(image: img)
        
       
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = colorFromRGB("CFD3D9")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
     
     override init(frame: CGRect) {
       super.init(frame: frame)
         addSubviews()
         setLayout()
         cameraImageView.isHidden = true
     }
     
     override func prepareForReuse() {
       super.prepareForReuse()
         prepare(image: nil)
     }
    
}

extension PhotoPickerCollectionViewCell {
    
    func addSubviews() {
        self.contentView.addSubviews(imageView,cameraImageView)
    }
    
    func setLayout() {
        
        imageView.setLeft(anchor: self.contentView.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.contentView.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.contentView.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.contentView.bottomAnchor, constant: .zero)
        
        cameraImageView.setCenter(view: self.contentView, offset: .zero)
        cameraImageView.setWidth(30)
        cameraImageView.setWidth(30)
        
    }
    
    public func prepare(image: UIImage?) {
        
        if image == nil {
            cameraImageView.isHidden = false
            self.contentView.backgroundColor = .lightGray
        } else {
            imageView.image = image
        }
        
      }
}
