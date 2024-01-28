//
//  UIBezierPath+Extension.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import UIKit

extension UIBezierPath {
    @discardableResult
    func move(_ x: CGFloat, _ y: CGFloat) -> UIBezierPath{
        move(to: CGPoint(x: x, y: y))
        return self
    }
    
    @discardableResult
    func line(_ x: CGFloat, _ y: CGFloat) -> UIBezierPath {
        addLine(to: CGPoint(x: x, y: y))
        return self
    }
    
    @discardableResult
    func closed() -> UIBezierPath {
        close()
        return self
    }
    
    @discardableResult
    func strokeFill(_ color: UIColor, lineWidth: CGFloat = 1) -> UIBezierPath {
        color.set()
        self.lineWidth = lineWidth
        stroke()
        fill()
        return self
    }
    
    @discardableResult
    func stroke(_ color: UIColor, lineWidth: CGFloat = 1) -> UIBezierPath {
        color.set()
        self.lineWidth = lineWidth
        stroke()
        return self
    }
}
