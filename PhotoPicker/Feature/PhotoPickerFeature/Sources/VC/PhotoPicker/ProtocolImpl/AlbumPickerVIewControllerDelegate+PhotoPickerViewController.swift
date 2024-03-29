//
//  AlbumPickerVIewControllerDelegate.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/28/24.
//

import Foundation
import Photos


extension PhotoPickerViewController : AlbumPickerVIewControllerDelegate {
    func selected(_ album: AlbumInfo) {
        navigationBarView.changeTitle(album.name, mode: .photoPicker)
    
        
        DispatchQueue.main.async {
            
            getPHAssets(album: album.album) { [weak self] result in
   
                guard let self else {return}
                
                self.input.fetchData.send(result.map{$0.getAssetThumbnail()})
            }
        }
    }
}
