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
    func tapCenterButton()
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
    
    private var titleButton: UIButton = {
        
        let view = UIButton()
        view.setTitle(title: "", ofSize: 17)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.textAlignment = .center
        
        
        return view
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
    
    private var mode: NavigationMode!
    

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
        changeTitle(title,mode: mode)
        
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
        self.addSubviews(leftButton,titleButton,rightLabel,rightButton)
    }
    
    private func setLayout() {
        
        switch mode {
            
        case .photoPicker, .edit:
                leftButton.setImage(.setImage(.back), for: .normal)
            leftButton.tintColor = mode == .photoPicker ? .setColor(.secondary) : .white
            
            rightButton.setTitle(title: "완료", ofSize: 15,textColor: mode == .photoPicker ? .setColor(.secondary) : .white, for: .normal)
                rightButton.setTitle(title: "완료", ofSize: 15,textColor: .lightGray ,for: .disabled)
                
            rightLabel.textColor = .setColor(.primary)
                rightLabel.font = .systemFont(ofSize: 15, weight: .bold)
            
           
                
            case .cut:
                leftButton.setImage(.setImage(.xmark), for: .normal)
                leftButton.tintColor = .white
                
                rightButton.setImage(.setImage(.check), for: .normal)
                rightButton.tintColor = .white

            case .none:
                DEBUG_LOG("")
        }
        
        if mode == .photoPicker {
            titleButton.semanticContentAttribute = .forceRightToLeft
            titleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10)
            titleButton.setImage(UIImage(systemName:"arrowtriangle.down.fill"),for: .normal)
            titleButton.tintColor = .white
        }
        
        let size: CGFloat = 40
        
        leftButton.setWidth(size)
        leftButton.setHeight(size)
        leftButton.setLeft(anchor: self.leftAnchor, constant: 20)
        leftButton.setCenterY(view: self, constant: 0)
        
        titleButton.setLeft(anchor: self.leftButton.rightAnchor, constant: 0)
        titleButton.setRight(anchor: self.rightButton.leftAnchor, constant: 0)
        titleButton.setCenterY(view: self,constant: 0)
       

        
        rightLabel.setHeight(size)
        rightLabel.setRight(anchor: self.rightButton.leftAnchor, constant: -4)
        rightLabel.setCenterY(view: self, constant: 0)
        
        rightButton.setWidth(size)
        rightButton.setHeight(size)
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
        
        titleButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                
                guard let self else {return}
                
                self.deleagte?.tapCenterButton()
                
            })
            .store(in: &subscription)
        
    }
    
    public func changeTitle(_ str: String, mode : NavigationMode) {
        
        
        titleButton.setTitle(title: str, ofSize: 17, weight: .bold, textColor: mode == .photoPicker ? .setColor(.secondary) : .white, for: .normal)
    }
    
    public func changeCountLabel(_ str: String) {
        self.rightLabel.text = str
    }
    
    public func changeAbleState(_ state: Bool) {
        self.rightButton.isEnabled = state

    }
}
