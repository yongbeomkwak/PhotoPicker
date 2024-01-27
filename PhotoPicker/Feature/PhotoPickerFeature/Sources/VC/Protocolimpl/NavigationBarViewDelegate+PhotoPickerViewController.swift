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
        delegate?.complete(data: output.finalItems.value)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
