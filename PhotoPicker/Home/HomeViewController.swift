//
//  ViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/23/24.
//

import UIKit

class HomeViewController: UIViewController {

    
    var photoPickerButton: UIButton = {
        
        let button = UIButton()
        let label = UILabel()
        
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCommonUI()
        addSubview()
        configureUI()
        
    }


}

extension HomeViewController {
    
    func addSubview() {
        self.view.addSubviews(photoPickerButton)
    }
    
    func configureUI() {
        // 버튼의 레이아웃 설정.
        photoPickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        photoPickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        photoPickerButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        photoPickerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}

