//
//  AlbumInfo.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/28/24.
//

import Foundation
import Photos

struct AlbumInfo : Identifiable {
    
    let id: String?
    let name : String
    let album : PHFetchResult<PHAsset>
}
