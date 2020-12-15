//
//  UIView+Extensions.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 07.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


extension UIView {
    func add(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
    
    func add(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }
    
    func remove(_ subviews: UIView...) {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func remove(_ subviews: [UIView]) {
        subviews.forEach { $0.removeFromSuperview() }
    }
}


extension UIView {
    var globalFrame: CGRect {
        return superview?.convert(frame, to: nil) ?? frame
    }
    
    var globalPoint: CGPoint {
        return superview?.convert(frame.origin, to: nil) ?? frame.origin
    }
    
    func createSnapshot(afterScreenUpdates: Bool) -> UIView? {
        guard let view = snapshotView(afterScreenUpdates: afterScreenUpdates) else {
            return nil
        }
        view.frame = globalFrame
        return view
    }
}

