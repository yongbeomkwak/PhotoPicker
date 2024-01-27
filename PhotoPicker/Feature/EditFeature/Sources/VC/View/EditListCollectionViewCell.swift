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
        
        imageView.setCenterY(view: self)
        imageView.setCenterX(view: self)
        imageView.setHeight(self.bounds.height)
        imageView.setWidth(self.bounds.width)
        

    }
    
    func prepare(_ data: Data?, _ state: RotateState) {
        
        let image = UIImage(data: data!)
        
        self.imageView.image = image
        
        
        DEBUG_LOG("STATE \(state)")
        
        switch state {
        
        case .none:
            break
        
        case .vertical:
            let rotate = CGAffineTransform(rotationAngle: .pi/2)
            self.imageView.transform = rotate
            
        case .horizontal:
            let rotate = CGAffineTransform(rotationAngle: .pi)
            self.imageView.transform = rotate
        case .flipVertical:
            let rotate = CGAffineTransform(rotationAngle: .pi*3/2)
            self.imageView.transform = rotate
        case .flipHorizontal:
            let rotate = CGAffineTransform(rotationAngle: .pi*2)
            self.imageView.transform = rotate
        }

    }
    
}
