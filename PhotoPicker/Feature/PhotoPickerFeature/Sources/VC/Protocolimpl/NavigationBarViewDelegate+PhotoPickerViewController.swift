//
//  NavigationBarViewDelegate+PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation


extension PhotoPickerViewController : NavigationBarViewDelegate {
    func tapCenterButton() {
        
        let vc = AlbumPickerVIewController()
        
        vc.modalPresentationStyle  = .formSheet

        vc.delegate = self 
        self.present(vc, animated: true)
        
    }
    
    
    func tapLeftButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tapRightButton() {
        delegate?.complete(data: output.finalItems.value)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
