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
    
    func rotate(degrees: CGFloat) -> UIImage {

            /// context에 그려질 크기를 구하기 위해서 최종 회전되었을때의 전체 크기 획득
            let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let affineTransform: CGAffineTransform = CGAffineTransform(rotationAngle: degrees * CGFloat.pi / 180)
            rotatedViewBox.transform = affineTransform

            /// 회전된 크기
            let rotatedSize: CGSize = rotatedViewBox.frame.size

            /// 회전한 만큼의 크기가 있을때, 필요없는 여백 부분을 제거하는 작업
            UIGraphicsBeginImageContext(rotatedSize)
            let bitmap: CGContext = UIGraphicsGetCurrentContext()!
            /// 원점을 이미지의 가운데로 평행 이동
            bitmap.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
            /// 회전
            bitmap.rotate(by: (degrees * CGFloat.pi / 180))
            /// 상하 대칭 변환 후 context에 원본 이미지 그림 그리는 작업
            bitmap.scaleBy(x: 1.0, y: -1.0)
            bitmap.draw(cgImage!, in: CGRect(x: -size.width / 2, y: -size.height / 2, width: size.width, height: size.height))

            /// 그려진 context로 부터 이미지 획득
            let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()

            return newImage
        }

    func configureImageviewSize() -> CGRect {
            // 이미지 원본 사이즈
            let imageWidth: CGFloat = self.size.width
            let imageHeight: CGFloat = self.size.height

            // 이미지 가로, 세로 최대 사이즈
            let maxContentWidth: CGFloat = APP_WIDTH()-40
            let maxContentHeight: CGFloat = APP_HEIGHT()-48-STATUS_BAR_HEGHIT()-SAFEAREA_BOTTOM_HEIGHT()-100

            // 최종 사이즈
            var resultWidth: CGFloat = 0
            var resultHeight: CGFloat = 0

            // 이미지 사이즈에 맞게 보정
            if imageWidth > imageHeight { // 가로
                resultWidth = maxContentWidth
                resultHeight = (maxContentWidth * self.size.height) / self.size.width

            }else if imageWidth < imageHeight { // 세로
                resultWidth = (maxContentHeight * self.size.width) / self.size.height
                resultHeight = maxContentHeight

                if resultWidth > maxContentWidth {
                    resultWidth = maxContentWidth
                    resultHeight = (maxContentWidth * self.size.height) / self.size.width
                }

            }else { // 1:1
                resultWidth = maxContentWidth
                resultHeight = maxContentWidth
                
               
            }
        
            return CGRect(x: 0, y: 0, width: resultWidth, height: resultHeight)
        }
}
