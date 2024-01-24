//
//  DaangnImageSystem.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

public extension UIImage {
    
    enum ImageSystem {
        case xmark
        case back
        case check
    }
    
    
    static func setImage(_ imgSystem: ImageSystem) -> UIImage {
        
        switch imgSystem {
            
        case .xmark:
            return UIImage(systemName: "xmark")!
            
        case .back:
            return UIImage(systemName: "chevron.left")!
                
        case .check:
            return UIImage(systemName: "checkmark")!
        }
        
        
    }
    
}
