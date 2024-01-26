//
//  EditListCollectionViewCell.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

class EditListCollectionViewCell: UICollectionViewCell {
    
    static let id = "EditListCollectionViewCell"
    
    let imageView: UIImageView = {
        
        let view = UIImageView()
        
        view.contentMode = .scaleAspectFit
        
        
        return view
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


extension EditListCollectionViewCell {
    
    func addSubviews() {
        self.contentView.addSubviews(imageView)
    }
    
    func setLayout() {
        
        imageView.setLeft(anchor: self.contentView.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.contentView.rightAnchor, constant: .zero)
        imageView.setTop(anchor: self.contentView.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.contentView.bottomAnchor, constant: .zero)
        imageView.setHeight(400)
        
    }
    
    func prepare(_ data: Data?) {
        
        
        let image = UIImage(data: data!)
        
        DEBUG_LOG("data \(image?.size)")
        
        self.imageView.image = image
        self.imageView.backgroundColor = .red
        
        
    }
    
}
