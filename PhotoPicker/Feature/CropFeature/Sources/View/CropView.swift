//
//  ControlView.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

public class CropView: UIView {
    private let margin: CGFloat = 0
    
    public let topLineView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let leftLineView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let bottomLineView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public let rightLineView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setLayout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addSubviews() {
        
        self.addSubviews(topLineView,leftLineView,bottomLineView,rightLineView)

        self.isUserInteractionEnabled = true
        backgroundColor = .clear
        topLineView.alpha = 1
        leftLineView.alpha = 1
        bottomLineView.alpha = 1
        rightLineView.alpha = 1

    }
    
    func setLayout() {
        
        topLineView.setTop(anchor: self.topAnchor, constant: .zero)
        topLineView.setLeft(anchor: self.leftAnchor, constant: .zero)
        topLineView.setRight(anchor: self.rightAnchor, constant: .zero)
        topLineView.setHeight(3)
        
        leftLineView.setTop(anchor: self.topAnchor, constant: .zero)
        leftLineView.setLeft(anchor: self.leftAnchor, constant: .zero)
        leftLineView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        leftLineView.setWidth(3)
        
        bottomLineView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        bottomLineView.setLeft(anchor: self.leftAnchor, constant: .zero)
        bottomLineView.setRight(anchor: self.rightAnchor, constant: .zero)
        bottomLineView.setHeight(3)
        
        rightLineView.setTop(anchor: self.topAnchor, constant: .zero)
        rightLineView.setRight(anchor: self.rightAnchor, constant: .zero)
        rightLineView.setBottom(anchor: self.bottomAnchor, constant: .zero)
        rightLineView.setWidth(3)
        
    }
    

}
