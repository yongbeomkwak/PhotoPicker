//
//  RequestPermissionable+PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import Foundation
import UIKit
import Photos


extension PhotoPickerViewController : RequestPermissionable {
   
    func showCamera() {
        let camera = UIImagePickerController()
            camera.sourceType = .camera
            camera.allowsEditing = true
            camera.cameraDevice = .rear
            camera.cameraCaptureMode = .photo
            camera.delegate = self
            self.present(camera, animated: true, completion: nil)
    }
    
    func showPhotoLibrary() {
        
         let getSortDescriptors = [
               NSSortDescriptor(key: "creationDate", ascending: false),
               NSSortDescriptor(key: "modificationDate", ascending: false)
           ] // 최근 항목
        
        let fetchOptions = PHFetchOptions()
     
        fetchOptions.sortDescriptors = getSortDescriptors
        
        let standardFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
    
        
        getPHAssets(album: standardFetchResult) { [weak self]  result in
            
            guard let self else {return}
            
            input.fetchData.send(result.map{ $0.getAssetThumbnail() })
        }
        
    }
    
    func getPHAssets(album: PHFetchResult<PHAsset>, completion: @escaping ([PHAsset]) -> Void) {
        guard 0 < album.count else { return }
        var phAssets = [PHAsset]()
        
        album.enumerateObjects { asset, index, stopPointer in
          guard index <= album.count - 1 else {
            stopPointer.pointee = true
            return
          }
          phAssets.append(asset)
        }
        
        completion(phAssets)
      }
    
}

extension PhotoPickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension PhotoPickerViewController : PHPhotoLibraryChangeObserver {
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        DispatchQueue.main.async {
            self.showPhotoLibrary()
        }
    }
}


