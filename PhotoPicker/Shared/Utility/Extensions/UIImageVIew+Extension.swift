//
//  UIImageVIew+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/27/24.
//

import UIKit

extension UIImageView {
    
    //이미지와 프레임 비를 이용하여 CGRect 
    var frameForImageInImageViewAspectFit: CGRect {
         if  let img = image {
             let imageRatio = img.size.width / img.size.height
             let viewRatio = frame.size.width / frame.size.height
             
             DEBUG_LOG("HHH \(img.size)")
             if(imageRatio < viewRatio) {
                 let scale = frame.size.height / img.size.height
                 let width = scale * img.size.width
                 let topLeftX = (frame.size.width - width) * 0.5
                 return CGRect(x: topLeftX, y: 0, width: width, height: frame.size.height)
             } else {
                 let scale = frame.size.width / img.size.width
                 let height = scale * img.size.height
                 let topLeftY = (frame.size.height - height) * 0.5
                 return CGRect(x: 0, y: topLeftY, width: frame.size.width, height: height)
             }
         }
         return CGRect(x: 0, y: 0, width: 0, height: 0)
     }
     
     var imageFrame: CGRect {
         let imageViewSize = frame.size
         guard let imageSize = image?.size else { return CGRect.zero }
         let imageRatio = imageSize.width / imageSize.height
         let imageViewRatio = imageViewSize.width / imageViewSize.height
         if imageRatio < imageViewRatio {
             let scaleFactor = imageViewSize.height / imageSize.height
             let width = imageSize.width * scaleFactor
             let topLeftX = (imageViewSize.width - width) * 0.5
             return CGRect(x: topLeftX, y: 0, width: width, height: imageViewSize.height)
         } else {
             let scalFactor = imageViewSize.width / imageSize.width
             let height = imageSize.height * scalFactor
             let topLeftY = (imageViewSize.height - height) * 0.5
             return CGRect(x: 0, y: topLeftY, width: imageViewSize.width, height: height)
         }
     }
}
