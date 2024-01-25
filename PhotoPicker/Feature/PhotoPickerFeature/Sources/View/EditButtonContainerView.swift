//
//  EditButtonContainerView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit

class BottomEditButtonContainerView: UIView {

    
    var editButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "wand.and.rays")!
        
        let flipedImage = image.flipHorizontally()! // 이미지 뒤집기
        
        button.setImage(flipedImage, for: .normal)
        button.tintColor = .setColor(.secondary)
        button.setTitle(title: "편집", ofSize: 16, weight: .light,textColor: .setColor(.secondary))
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLayout()
        DEBUG_LOG("✅ \(Self.self) Init")
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        DEBUG_LOG("❌ \(Self.self) DeInit")
    }

}

extension BottomEditButtonContainerView {
    
    func addSubviews() {
        self.addSubviews(editButton)
    }
    
    func setLayout() {
        
        self.layer.addBorder(edge: .top, color: .gray, thickness: 1)
        
        editButton.setTop(anchor: self.topAnchor, constant: 10)
        editButton.setLeft(anchor: self.leftAnchor, constant:20)
        editButton.setHeight(30)
        
    }
    
    
}
