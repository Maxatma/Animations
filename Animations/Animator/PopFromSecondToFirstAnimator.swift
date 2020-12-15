//
//  PopFromSecondToFirstAnimator.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 23.09.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//


import UIKit


final class PopFromSecondToFirstAnimator: BaseAnimator<SecondVC, FirstVC> {
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        super.animateTransition(using: transitionContext)
        
        containerView.add(toVC.view)
        containerView.sendSubviewToBack(toVC.view)
        fromVC.view.alpha = 0
        
        guard
            let logo = fromVC.logo.createSnapshot(afterScreenUpdates: true),
            let name = fromVC.name.createSnapshot(afterScreenUpdates: true)
            else {
                transitionContext.completeTransition(true)
                return
        }
        
        guard
            let indexPath = toVC.collectionView.indexPathsForSelectedItems?.first,
            let card = toVC.collectionView.cellForItem(at: indexPath) as? CollectionCard
            else {
                transitionContext.completeTransition(true)
                return
        }
        
        let background = UIView(frame: fromVC.view.frame)
        background.backgroundColor = fromVC.view.backgroundColor
        
        let fadeAnimator = SecondVCFadeAnimator(vc: fromVC)
        fadeAnimator.prepareForFadeOut()
        
        
        containerView.add(background, logo, name)
        containerView.add(fadeAnimator.snapshots)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView
            .animateKeyframes(withDuration: duration,
                              delay: 0,
                              options: .calculationModeLinear,
                              animations: {
                                
                                
                                UIView.addKeyframe(withRelativeStartTime: 0.7,
                                                   relativeDuration: 0.3,
                                                   animations: {
                                                    background.frame = card.background.globalFrame
                                                    logo.frame = card.logo.globalFrame
                                                    name.frame = card.name.globalFrame
                                })
                                
                                fadeAnimator.addKeyFrameFadeOut()
            },
                              completion: { [unowned self] _ in
                                self.containerView.remove(logo, name, background)
                                self.containerView.remove(fadeAnimator.snapshots)
                                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
    }
}

