//
//  NavigationBar.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import UIKit
import Combine

public enum NavigationMode {
    
    case photoPicker
    case edit
    case cut

    var left : String {
        
        switch self {
        case .photoPicker , .edit :
                
            return "chevron.left"
            
        case .cut:
            
            return "xmark"
            
        }
        
    }
    
    var right : String {
        
        switch self {
        case .photoPicker , .edit:
            return "완료"
            
        case .cut:
            return "xmark"
        }
        
    }
        
}


protocol NavigationBarViewDelegate : AnyObject {
    
    func tapLeftButton()
    func tapRightButton()
    
}


class NavigationBarView: UIView {
    
    
    weak var deleagte: NavigationBarViewDelegate?
    private var subscription: Set<AnyCancellable> = .init()
    
    private var leftButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        
        return label
    }()
    
    private var rightButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var rightLabel: UILabel =  {
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        
        return label
        
    }()
    
    private var mode: NavigationMode = .photoPicker
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(frame: CGRect,title: String, mode:NavigationMode) {
        self.init(frame: frame)
        DEBUG_LOG("✅ \(Self.self) Init")
        self.mode = mode
        
        addSubviews()
        setLayout()
        bindEvent()
        changeTitle(title)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        DEBUG_LOG("❌ \(Self.self) DeInit")
    }
    
}

extension NavigationBarView {
    
    private func addSubviews() {
        self.addSubviews(leftButton,titleLabel,rightLabel,rightButton)
    }
    
    private func setLayout() {
        
        switch mode {
            
        case .photoPicker, .edit:
                leftButton.setImage(.setImage(.back), for: .normal)
                leftButton.tintColor = .setColor(.secondary)
            
                rightButton.setTitle(title: "완료", ofSize: 15,for: .normal)
                rightButton.setTitle(title: "완료", ofSize: 15,textColor: .gray ,for: .disabled)
                
                rightLabel.textColor = .setColor(.primary)
                rightLabel.font = .systemFont(ofSize: 15, weight: .bold)
                
                titleLabel.textColor = mode == .photoPicker ? .setColor(.secondary) : .white
                
            case .cut:
                leftButton.setImage(.setImage(.xmark), for: .normal)
                leftButton.tintColor = .white
                
                rightButton.setImage(.setImage(.check), for: .normal)
                rightButton.tintColor = .white
            
            
        }
        
        leftButton.setWidth(30)
        leftButton.setHeight(30)
        leftButton.setLeft(anchor: self.leftAnchor, constant: 20)
        leftButton.setCenterY(view: self, constant: 0)
        
        titleLabel.setLeft(anchor: self.leftAnchor, constant: 0)
        titleLabel.setRight(anchor: self.rightAnchor, constant: 0)
        titleLabel.setCenterY(view: self,constant: 0)
       

        
        rightLabel.setHeight(30)
        rightLabel.setRight(anchor: self.rightButton.leftAnchor, constant: -4)
        rightLabel.setCenterY(view: self, constant: 0)
        
        rightButton.setWidth(40)
        rightButton.setHeight(30)
        rightButton.setRight(anchor: self.rightAnchor, constant: 15)
        rightButton.setCenterY(view: self, constant: 0)

        
    }
    
    private func bindEvent() {
        
        leftButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                
                guard let self else {return}
                
                self.deleagte?.tapLeftButton()
                
            })
            .store(in: &subscription)
        
        rightButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                
                guard let self else {return}
                
                self.deleagte?.tapRightButton()
                
            })
            .store(in: &subscription)

        
    }
    
    public func changeTitle(_ str: String) {
        self.titleLabel.text = str
    }
    
}
