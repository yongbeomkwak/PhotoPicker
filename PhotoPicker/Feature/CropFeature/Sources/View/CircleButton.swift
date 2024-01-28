//
//  CircleButton.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/27/24.
//

import UIKit


class CircleButton: UIButton {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
    }
       
   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}
