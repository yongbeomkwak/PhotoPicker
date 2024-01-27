//
//  EdgeCircleView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

enum EdgeCircleType {
    
    case leftTop
    case leftBttom
    case rightTop
    case rightBttom
    
    
}

class EdgeCircleButton: UIButton {

    private var type: EdgeCircleType
    
    init(_ type: EdgeCircleType) {
        self.type = type
        super.init(frame: .init(x: 0, y: 0, width: 50, height: 50))
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
