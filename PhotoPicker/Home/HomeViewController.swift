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
        
        button.backgroundColor = .setColor(.primary)
        button.setRound(.allCorners, radius: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle(title: "사진 올리기", ofSize: 20,weight: .bold)
        
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
        photoPickerButton.setBottom(anchor: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 45)
        photoPickerButton.setLeft(anchor: self.view.safeAreaLayoutGuide.rightAnchor, constant: 20)
        photoPickerButton.setRight(anchor: self.view.safeAreaLayoutGuide.rightAnchor, constant: 20)
        photoPickerButton.setHeight(48)
        
    }
    
    
    @objc func btnClick() {
        photoPickerButton.setTitle("btn", for: .normal)
    }
    
}

