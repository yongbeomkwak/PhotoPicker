//
//  DaangnColorSystem.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

public extension UIColor {
    
    enum ColorSystem {
        case primary
        case secondary
        case bg
    }
    
    
    static func setColor(_ cs: ColorSystem) -> UIColor {
        
        switch cs {
            case .primary:
                return UIColor(named: "PrimaryColor")!
            
            case .secondary:
                return UIColor(named: "SecondaryColor")!
            
        case .bg:
            return UIColor(named: "BackgroundColor")!
            
        }
        
    }
    
}
