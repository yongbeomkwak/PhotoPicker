//
//  EditListFactory.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

import UIKit

public protocol EditListFactory {
    func makeViewController(images: [Data?]) -> UIViewController
}
