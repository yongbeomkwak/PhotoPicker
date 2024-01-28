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
        
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    
    var cameraImageView: UIImageView = {
        
        let img = UIImage(systemName: "camera.fill")!.withRenderingMode(.alwaysTemplate)
        
        let imageView = UIImageView(image: img)
        
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    
    var countLabel: UILabel = {
        
        let label = UILabel()
        
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .heavy, width: .standard)
        label.textColor = .white
        
        
        return label
    }()
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
     }
     
     override init(frame: CGRect) {
       super.init(frame: frame)
         addSubviews()
         setLayout()
     }
     
    
}

extension PhotoPickerCollectionViewCell {
    
    func addSubviews() {
        self.contentView.addSubviews(imageView,cameraImageView,countLabel)
    }
    
    func setLayout() {
        
        imageView.setLeft(anchor: self.contentView.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.contentView.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.contentView.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.contentView.bottomAnchor, constant: .zero)
           
        countLabel.setTop(anchor: self.contentView.topAnchor, constant: 10)
        countLabel.setRight(anchor: self.contentView.rightAnchor, constant: 10)
        countLabel.setHeight(20)
        countLabel.setWidth(20)
        countLabel.layer.cornerRadius = 10
        countLabel.layer.borderWidth = 2
        countLabel.clipsToBounds = true
        
        cameraImageView.setCenter(view: self.contentView, offset: .zero)
        cameraImageView.setWidth(30)
        cameraImageView.setHeight(30)
        
    }
    
    public func prepare(_ model: ImageEntity) {
    
        if let image =  model.image {
            imageView.image =  UIImage(data: image)
        } else {
            imageView.image = nil
        }
        
        if model.id == -1 { // 카메라 버튼
            cameraImageView.isHidden = false
            self.contentView.backgroundColor = colorFromRGB("CFD3D9")
            countLabel.isHidden = true
            imageView.isHidden = true
            
            return
        } else {
            cameraImageView.isHidden = true
            self.contentView.backgroundColor = .clear
            countLabel.isHidden = false
            imageView.isHidden = false
            
        }
        
        
        model.isSelected ? selected(model) : deSelected(model)
        
        
    }
    
    
    func selected(_ model: ImageEntity) {
        
        imageView.layer.borderColor = UIColor.setColor(.primary).cgColor
        countLabel.layer.borderColor = UIColor.setColor(.primary).cgColor
        countLabel.backgroundColor = .setColor(.primary)
        countLabel.text = "\(model.index)"
        
        
    }
    
    func deSelected(_ mode: ImageEntity) {
        
        imageView.layer.borderColor = UIColor.clear.cgColor
        countLabel.layer.borderColor = UIColor.white.cgColor
        countLabel.backgroundColor = .clear
        countLabel.text = ""
      
    }
}
