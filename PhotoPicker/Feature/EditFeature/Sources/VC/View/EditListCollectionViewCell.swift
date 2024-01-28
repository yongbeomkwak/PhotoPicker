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
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
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
        

//        imageView.setCenter(view: self.contentView, offset: .zero)
//        imageView.setWidth(self.bounds.width)
//        imageView.setHeight(self.bounds.height)
        
        imageView.setTop(anchor: self.contentView.topAnchor, constant: .zero)
        imageView.setBottom(anchor: self.contentView.bottomAnchor, constant: .zero)
        imageView.setLeft(anchor: self.contentView.leftAnchor, constant: .zero)
        imageView.setRight(anchor: self.contentView.rightAnchor, constant: .zero)
        
        

        
    }
    
    func prepare(_ data: Data?, _ state: RotateState) {
        
        let image = UIImage(data: data!)
        
        self.imageView.image = image
        
        /*세로모드
         
         width , height
         
         가로모드
         
         height -> width -> APP_WIDHT()
         width -> heigt -> ?
         
         
         self.bounds.height : APP_WIDHT = self.bounds.width : ?
         
         ? = APP_WIDHT * self.bounds.widht / self.bounds.height
         
        */
        
        rotate(state)
        
        
        DEBUG_LOG("frame: \(self.bounds)")
        DEBUG_LOG("frame: \(imageView.frame)")
    }
    
    func rotate(_ state: RotateState) {
        
        let image = imageView.image
        
        var degree : CGFloat = .zero
        
        switch state {
            
        case .none:
            degree = .zero
        
        default:
            degree = 90
        }
        
        imageView.image = image!.rotate(degrees: degree)
    }
    
}
