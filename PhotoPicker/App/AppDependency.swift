//
//  AppDependency.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

struct AppDependency {
    let rootViewController : UIViewController
}

extension AppDependency {
    
    static func generate() -> AppDependency {
        
        
        let component = HomeFeatureComponent()
        
        let factory = component.homeFactory
        
        
        return AppDependency(rootViewController: factory.makeViewController())
    }
}
