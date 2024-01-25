//
//  ImageEntity.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import Foundation
import UIKit

struct ImageEntity {
    
    var id: Int
    var image: UIImage?
    var isSelected: Bool
    
    init(id: Int = 0 , image: UIImage? = nil, isSelected: Bool = false) {
        self.id = id
        self.image = image
        self.isSelected = isSelected
    }
    
}
