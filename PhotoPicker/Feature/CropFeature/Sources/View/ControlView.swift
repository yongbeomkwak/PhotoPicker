//
//  ControlView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

class ControlView: UIView {
    

    
    var leftTopButton : EdgeCircleButton = {
        let view = EdgeCircleButton(.leftTop)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews(leftTopButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


