//
//  NavigationBarViewDelegate+EditListViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation


extension EditListViewController : NavigationBarViewDelegate {
    
    func tapLeftButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tapRightButton() {
        
    }
    
    
}
