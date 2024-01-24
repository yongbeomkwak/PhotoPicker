//
//  HomeFeatureComponent.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation

public struct HomeFeatureComponent {
    
    public let homeFactory: any HomeFactory
    
    public init() {
        self.homeFactory = HomeFactoryImpl()
    }
    
}
