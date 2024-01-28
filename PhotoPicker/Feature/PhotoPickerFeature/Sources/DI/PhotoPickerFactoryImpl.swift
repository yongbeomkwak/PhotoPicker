//
//  PhotoPickerFactoryImpl.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation
import UIKit

final class PhotoPickerFactoryImpl : PhotoPickerFactory {
    
    func makeViewController() -> UIViewController {
        
        let viewModel = PhotoPickerViewModel()
        
        return PhotoPickerViewController(viewModel: viewModel,editListComponent: EditListComponent())
    }
    
}

