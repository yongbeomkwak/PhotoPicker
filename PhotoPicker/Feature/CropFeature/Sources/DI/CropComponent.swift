//
//  CropComponent.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

public struct CropComponent {
    
    public let cropFactory: any CropFactory
    
    public init() {
        self.cropFactory = CropFactoryImpl()
    }
    
}
