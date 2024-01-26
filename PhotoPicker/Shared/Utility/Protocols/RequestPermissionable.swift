//
//  RequestPermissionable.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//


import Foundation
import UIKit
import AVFoundation
import Photos

public enum RequestPermissionType{
    case camera
    case photoLibrary
    
    var message : String {
        
        switch self {
        case .camera:
            return "[선택권한] 카메라 촬영을 하려면 권한 승인이 필요합니다."
            
        case .photoLibrary:
            return "[선택권한] 앨범 사진을 첨부 하려면 권한 승인이 필요합니다."
        }
        
    }
}

public protocol RequestPermissionable: AnyObject {
    func requestCameraPermission()
    func requestPhotoLibraryPermission()
    func showErrorMessage(type: RequestPermissionType)
    func showCamera()
    func showPhotoLibrary()
}

public extension RequestPermissionable where Self: UIViewController {
    func requestCameraPermission() {
        let cameraMediaType = AVMediaType.video
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        
        switch cameraAuthorizationStatus {
        case .denied, .restricted: // 권한 거부 , 엑세스 불가
            self.showErrorMessage(type: .camera)
            
        case .authorized: // 권한 허용
            self.showCamera()
            
        case .notDetermined: // 권한 요청 전
            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.showCamera()
                    }
                }else {
                    self.showErrorMessage(type: .camera)
                }
            }
        default: return
        }
    }

    func requestPhotoLibraryPermission() {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
    
        
        switch status {
        case .authorized,.limited:
            DispatchQueue.main.async {
                self.showPhotoLibrary()
            }
        case .denied, .restricted:
            self.showErrorMessage(type: .photoLibrary)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized, .limited:
                    DispatchQueue.main.async {
                        self.showPhotoLibrary()
                    }
                case .denied, .restricted:
                    self.showErrorMessage(type: .photoLibrary)
                default: return
                }
            }
        default: return
        }
    }
    
    func showErrorMessage(type: RequestPermissionType) {
    
        
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: "권한이 거부 됨",
                                                        message: type.message,
                                                        preferredStyle: UIAlertController.Style.alert)
            
            let okAction = UIAlertAction(title: "설정 바로가기", style: .default) { (_) in
                guard let openSettingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                UIApplication.shared.open(openSettingsURL)
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (_) in
                
            }
            
            alertViewController.addAction(okAction)
            alertViewController.addAction(cancelAction)
            self.present(alertViewController, animated: true, completion: nil)
        }
    }
}
