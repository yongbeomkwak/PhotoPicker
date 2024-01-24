//
//  EditButtonContainerView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

class EditButtonContainerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect,title: String, mode:NavigationMode) {
        self.init(frame: frame)
        DEBUG_LOG("✅ \(Self.self) Init")

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        DEBUG_LOG("❌ \(Self.self) DeInit")
    }

}
