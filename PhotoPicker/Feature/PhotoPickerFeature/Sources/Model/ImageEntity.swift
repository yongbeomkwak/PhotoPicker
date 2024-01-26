//
//  ImageEntity.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import Foundation
import UIKit

struct ImageEntity : Codable {
    
    var id: Int
    var index: Int
    var image: Data?
    var isSelected: Bool
    
    init(index: Int,image: Data? = nil,  id: Int = UUID().hashValue ,isSelected: Bool = false) {
        self.id = id
        self.index = index
        self.image = image
        self.isSelected = isSelected
    }
    
}
