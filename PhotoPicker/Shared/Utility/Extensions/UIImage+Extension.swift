//
//  UIImage+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

extension UIImage {
    func flipHorizontally() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        context.translateBy(x: self.size.width/2, y: self.size.height/2)
        context.scaleBy(x: -1.0, y: 1.0)
        context.translateBy(x: -self.size.width/2, y: -self.size.height/2)
        
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    var fixOrientation: UIImage? {
            if imageOrientation == .up { return self }
            var transform = CGAffineTransform.identity

            if imageOrientation == .down || imageOrientation == .downMirrored {
                transform = transform.translatedBy(x: size.width, y: size.height)
                transform = transform.rotated(by: CGFloat(Double.pi))
            }

            if imageOrientation == .left || imageOrientation == .leftMirrored {
                transform = transform.translatedBy(x: size.width, y: 0)
                transform = transform.rotated(by: CGFloat(Double.pi / 2.0))
            }

            if imageOrientation == .right || imageOrientation == .rightMirrored {
                transform = transform.translatedBy(x: 0, y: size.height)
                transform = transform.rotated(by: CGFloat(-Double.pi / 2.0))
            }

            if imageOrientation == .upMirrored || imageOrientation == .downMirrored {
                transform = transform.translatedBy(x: size.width, y: 0)
                transform = transform.scaledBy(x: -1, y: 1)
            }

            if imageOrientation == .leftMirrored || imageOrientation == .rightMirrored {
                transform = transform.translatedBy(x: size.height, y: 0)
                transform = transform.scaledBy(x: -1, y: 1)
            }

            guard let cgImage = cgImage,
                let colorSpace = cgImage.colorSpace else { return nil }

            guard let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height),
                                      bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0,
                                      space: colorSpace,
                                      bitmapInfo: cgImage.bitmapInfo.rawValue) else { return nil }

            ctx.concatenate(transform)

            if imageOrientation == .left ||
                imageOrientation == .leftMirrored ||
                imageOrientation == .right ||
                imageOrientation == .rightMirrored {
                ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
            } else {
                ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            guard let makeImage = ctx.makeImage() else { return nil }
            return UIImage(cgImage: makeImage)
        }

        func crop(_ rect: CGRect, radius: CGFloat, radiusScale: CGFloat, scale: CGFloat = 1) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width / scale, height: rect.size.height / scale), true, 0.0)
            draw(at: CGPoint(x: -rect.origin.x / scale, y: -rect.origin.y / scale))
            let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if radius == 0 {
                return croppedImage
            } else {
                guard let image = croppedImage else { return nil }
                let imageView = UIImageView(image: image)
                let layer = imageView.layer
                layer.masksToBounds = true
                layer.cornerRadius = radius * radiusScale
                UIGraphicsBeginImageContext(imageView.bounds.size)
                if let currentContext = UIGraphicsGetCurrentContext() {
                    layer.render(in: currentContext)
                }
                let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return croppedImage
            }
        }
}
