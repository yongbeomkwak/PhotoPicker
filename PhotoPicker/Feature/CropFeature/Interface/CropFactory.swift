//
//  CropFactory.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import UIKit

public protocol CropFactory {
    func makeViewController(data: Data?) -> UIViewController
}
