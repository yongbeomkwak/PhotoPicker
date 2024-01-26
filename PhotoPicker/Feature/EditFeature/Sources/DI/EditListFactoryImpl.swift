//
//  EditListFactoryImpl.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import UIKit

final class EditListFactoryImpl : EditListFactory {
    
    func makeViewController(images: [Data?]) -> UIViewController {
        
        let viewModel = EditListViewModel()
        
        return EditListViewController(viewModel: viewModel)
    }
    
}
