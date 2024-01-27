//
//  BottomEditButtonContainerView+PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

extension PhotoPickerViewController : BottomEditButtonContainerViewDelegate {
    func process() {
        
        //TODO: 이미지 데이터 넘겨주기
    
        self.navigationController?.pushViewController(editListComponent.editListFactory.makeViewController(images: output.finalItems.value ), animated: true)
    }

}
