//
//  CropFactoryImpl.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import UIKit

final class CropFactoryImpl : CropFactory {
    func makeViewController(data: Data?) -> UIViewController {
        
        let viewModel = CropViewModel(data: data)
        
        
        return CropViewController(viewModel: viewModel)
    }
    
    

    
}
