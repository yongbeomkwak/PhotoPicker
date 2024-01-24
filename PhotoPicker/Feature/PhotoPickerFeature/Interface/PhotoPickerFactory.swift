//
//  PhotoPickerFactory.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

public protocol PhotoPickerFactory {
    func makeViewController() -> UIViewController
}
