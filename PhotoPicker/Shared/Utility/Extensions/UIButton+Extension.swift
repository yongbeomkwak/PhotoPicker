//
//  UIButton+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

extension UIButton {
    
    func setTitle(title: String?, ofSize fontSize: CGFloat, weight: UIFont.Weight = .light, textColor: UIColor = .setColor(.secondary)  ,for state: UIControl.State = .normal){
        
        self.setTitle(title, for: state)
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
        self.setTitleColor(textColor, for: state)
    }
    
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
    
}
