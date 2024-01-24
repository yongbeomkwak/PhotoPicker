//
//  UIViewController+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import Foundation
import UIKit

public extension UIViewController {
    
    var wrapNavigationController: UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    
    func configureCommonUI() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        if #available(iOS 15.0, *) {
            let tableViews = self.view.subviews.map { $0 as? UITableView }.compactMap { $0 }
            tableViews.forEach {
                $0.sectionHeaderTopPadding = 0
            }
        }
        
        self.view.backgroundColor = .setColor(.bg)
        
    }
    
}
