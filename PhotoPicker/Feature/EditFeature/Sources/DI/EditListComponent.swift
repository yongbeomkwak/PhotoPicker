//
//  EditListComponent.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

public struct EditListComponent {
    
    public let editListFactory: any EditListFactory
    
    public init() {
        self.editListFactory = EditListFactoryImpl()
    }
    
}
