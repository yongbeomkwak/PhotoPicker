//
//  UIButton.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit
import Combine

extension UIButton {
    var tapPublisher: AnyPublisher<Void,Never> {
        
        controlPublisher(for: .touchUpInside)
            .compactMap{_ in ()}
            .eraseToAnyPublisher()

    }
}
