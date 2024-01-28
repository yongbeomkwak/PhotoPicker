//
//  CropView+Event.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/28/24.
//

import Foundation
import UIKit

extension CropPickerView {
    
    @objc func handleGesture(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.cropView)
            sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self)
    }
   
    @objc func leftTopButtonDrag(_ sender: UIButton) {
    
        
        DEBUG_LOG("TTT")
    }
}
