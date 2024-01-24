//
//  PhotoPickerComponent.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation

public struct PhotoPickerComponent {
    
    public let photoPickerFactory: any PhotoPickerFactory
    
    public init() {
        self.photoPickerFactory = PhotoPickerFactoryImpl()
    }
    
}
