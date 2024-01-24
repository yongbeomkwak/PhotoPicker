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
        
        
        photoPickerButton.setCenterX(view: self.view)
        
        photoPickerButton.setBottom(anchor: self.view.bottomAnchor, constant: -30)
    
        photoPickerButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        photoPickerButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    @objc func btnClick() {
        photoPickerButton.setTitle("btn", for: .normal)
    }
    
}

