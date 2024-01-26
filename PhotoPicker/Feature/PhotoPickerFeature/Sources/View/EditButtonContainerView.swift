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
       
        button.setTitle(title: "편집", ofSize: 16, weight: .light,textColor: .setColor(.secondary))
        button.setTitle(title: "편집", ofSize: 16,textColor: .lightGray ,for: .disabled)
        button.setInsets(forContentPadding: .zero, imageTitlePadding: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
    var borderView: UIView = {
       
        let view = UIView()
        
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
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
        self.addSubviews(editButton,borderView)
    }
    
    func setLayout() {
        
        borderView.setLeft(anchor: self.leftAnchor, constant: .zero)
        borderView.setRight(anchor: self.rightAnchor, constant: .zero)
        borderView.setHeight(1)
        borderView.setTop(anchor: self.topAnchor, constant: .zero)
        
        editButton.setTop(anchor: self.borderView.bottomAnchor, constant: 9)
        editButton.setLeft(anchor: self.leftAnchor, constant:20)
        editButton.setHeight(30)
        
    }
    
    public func changeAbleState(_ state: Bool) {
        
        self.editButton.isEnabled = state
        
        editButton.tintColor = state ? .setColor(.secondary) : .lightGray
    }
    
}
