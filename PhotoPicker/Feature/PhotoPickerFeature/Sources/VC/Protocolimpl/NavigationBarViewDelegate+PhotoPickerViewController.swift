//
//  NavigationBarViewDelegate+PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation


extension PhotoPickerViewController : NavigationBarViewDelegate {
    
    func tapLeftButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tapRightButton() {
        // TODO: 데이터 밖으로 
    }
    
    
}
