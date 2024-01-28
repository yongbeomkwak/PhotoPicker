//
//  NavigationBarViewDelegate+EditListViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import Combine

extension EditListViewController : NavigationBarViewDelegate {
    func tapCenterButton() {
        
    }
    
    
    func tapLeftButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tapRightButton() {
        
        NotificationCenter.default
            .post(name: .passFinalData, object: viewModel.dataes)
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
}
