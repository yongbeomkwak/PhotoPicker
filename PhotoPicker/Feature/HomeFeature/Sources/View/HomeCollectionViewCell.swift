//
//  PhotoPickerCollectionViewCell.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    static let id : String = "HomeCollectionViewCell"
    
    var imageView: UIImageView = {
        
        let imageView = UIImageView()
       
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.borderWidth = 2
        imageView.clipsToBounds = true
        
        return imageView
        
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

extension HomeCollectionViewCell {
    
    func addSubviews() {
        self.contentView.addSubviews(imageView)
    }
    
    func setLayout() {
        
        imageView.setLeft(anchor: self.contentView.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.contentView.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.contentView.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.contentView.bottomAnchor, constant: .zero)
           
    }
    
    public func prepare(_ model: Data?) {
    
        if let data =  model {
            imageView.image =  UIImage(data: data)
        } else {
            imageView.image = nil
        }
        
        
    }
    
}
