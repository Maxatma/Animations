//
//  BaseFadeAnimator.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 07.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


class BasicFadeAnimator {
    var fadeInHeight: CGFloat = 40
    
    var snapshots = [UIView]()
    var snapshotsFromBot = [UIView]()
    var snapshotsFromTop = [UIView]()
    
    
    func prepareForFadeIn() {
        
        snapshotsFromBot.forEach {
            $0.alpha = 0
            $0.frame.origin.y += fadeInHeight
        }
        
        snapshotsFromTop.forEach {
            $0.alpha = 0
            $0.frame.origin.y -= fadeInHeight
        }
    }
    
    func prepareForFadeOut() {
        snapshots.forEach { $0.alpha = 1 }
    }
    
    func fadeInFromBot(views: UIView ...) {
        views.forEach {
            $0.alpha  = 1
            $0.frame.origin.y -= fadeInHeight
        }
    }
    
    func fadeInFromTop(views: UIView ...) {
        views.forEach {
            $0.alpha  = 1
            $0.frame.origin.y += fadeInHeight
        }
    }
    
    func fadeOutFromBot(views: UIView ...) {
        views.forEach {
            $0.alpha  = 0
            $0.frame.origin.y += fadeInHeight
        }
    }
    
    func fadeOutFromTop(views: UIView ...) {
        views.forEach {
            $0.alpha  = 0
            $0.frame.origin.y -= fadeInHeight
        }
    }
}

