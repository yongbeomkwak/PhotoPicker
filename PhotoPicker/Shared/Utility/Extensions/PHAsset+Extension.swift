//
//  PHAsset+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import Photos
import UIKit

extension PHAsset {
    
    func getAssetThumbnail() -> UIImage {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        option.deliveryMode = .highQualityFormat
        var thumbnail = UIImage()
        manager.requestImage(for: self,
                                targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                                contentMode: .aspectFit,
                                options: option,
                                resultHandler: {(result, info) -> Void in
          thumbnail = result!
        })
        return thumbnail
      }
    
}
