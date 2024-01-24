//
//  UIButton+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

extension UIButton {
    
    func setTitle(title: String?, ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular, textColor: UIColor = .white  ,for state: UIControl.State = .normal){
        
        self.setTitle(title, for: state)
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: weight)
        self.setTitleColor(textColor, for: state)
    }
    
}
