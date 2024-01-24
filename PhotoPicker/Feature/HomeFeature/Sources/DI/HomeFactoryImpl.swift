//
//  HomeFactoryImpl.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation
import UIKit

final class HomeFactoryImpl : HomeFactory {
    
    func makeViewController() -> UIViewController {
            let viewModel = HomeViewModel()
            let photoPickerComponent = PhotoPickerComponent()
        
        return HomeViewController(viewModel: viewModel, photoPickerComponent: photoPickerComponent)
    }
    
}
