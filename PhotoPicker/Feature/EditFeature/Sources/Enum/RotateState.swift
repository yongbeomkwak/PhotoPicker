//
//  RotateState.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/28/24.
//

import Foundation

enum RotateState : Int {
    case none = -1 // 초기 상태 회전 방지
    case vertical = 0
    case horizontal
    case flipVertical
    case flipHorizontal
    
    func next() -> RotateState {
        
        if self == .none {
            return .horizontal
        }
        return RotateState(rawValue:(self.rawValue+1)%4)!
    }
    
}
