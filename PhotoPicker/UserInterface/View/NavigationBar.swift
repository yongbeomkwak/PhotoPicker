//
//  NavigationBar.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

public enum NavigationMode {
    
    case photoPicker
    case edit
    case cut

    var left : String {
        
        switch self {
        case .photoPicker , .edit :
                
            return "chevron.left"
            
        case .cut:
            
            return "xmark"
            
        }
        
    }
    
    var right : String {
        
        switch self {
        case .photoPicker , .edit:
            return "완료"
            
        case .cut:
            return "xmark"
        }
        
    }
    
    var
    
    
    
}

class NavigationBar: UIView {
    
    
    var leftButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(title: "사진 올리기", ofSize: 20,weight: .bold)
        
        return button
        
    }()
    
    var mode: NavigationMode!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect,title: String, mode:NavigationMode) {
        self.init(frame: frame)
        self.mode = mode
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NavigationBar {
    
    
}
