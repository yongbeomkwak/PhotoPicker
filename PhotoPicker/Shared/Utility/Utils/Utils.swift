//
//  Utils.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import UIKit
import Photos

public func APP_WIDTH() -> CGFloat {
    return UIScreen.main.bounds.size.width
}

public func APP_HEIGHT() -> CGFloat {
    return UIScreen.main.bounds.size.height
}

public func STATUS_BAR_HEGHIT() -> CGFloat {
    return max(20, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
}

public func SAFEAREA_BOTTOM_HEIGHT() -> CGFloat {
    return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
}

// use: colorFromRGB(0xffffff)
public func colorFromRGB(_ rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                   green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
                   blue: CGFloat(rgbValue & 0xFF) / 255.0, alpha: alpha)
}

// use: colorFromRGB("ffffff")
public func colorFromRGB(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
    let hexToInt = UInt32(Float64("0x" + hexString) ?? 0)
    return UIColor(red: CGFloat((hexToInt & 0xFF0000) >> 16) / 255.0,
                   green: CGFloat((hexToInt & 0xFF00) >> 8) / 255.0,
                   blue: CGFloat(hexToInt & 0xFF) / 255.0, alpha: alpha)
}

public func DEBUG_LOG(_ msg: Any, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        let fileName = file.split(separator: "/").last ?? ""
        let funcName = function.split(separator: "(").first ?? ""
        print("[\(fileName)] \(funcName)(\(line)): \(msg)")
    #endif
}


public func getPHAssets(album: PHFetchResult<PHAsset>, completion: @escaping ([PHAsset]) -> Void) {
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
