//
//  UIView+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import Foundation
import UIKit

public extension UIView {
    
    // use: addSubview(firstView, secondView)
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
