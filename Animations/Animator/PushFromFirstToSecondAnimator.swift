//
//  PushFromFirstToSecondAnimator.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/8/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


final class PushFromFirstToSecondAnimator: BaseAnimator<FirstVC, SecondVC> {
    
    
    override func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        super.animateTransition(using: transitionContext)
        
        containerView.add(toVC.view)
        containerView.sendSubviewToBack(toVC.view)
        toVC.view.alpha = 0
        toVC.view.layoutIfNeeded()
        toVC.name.superview!.layoutIfNeeded()

        guard
            let indexPath = fromVC.collectionView.indexPathsForSelectedItems?.first,
            let card = fromVC.collectionView.cellForItem(at: indexPath) as? CollectionCard,
            let name = card.name.createSnapshot(afterScreenUpdates: true),
            let logo = card.logo.createSnapshot(afterScreenUpdates: true),
            let info = card.info.createSnapshot(afterScreenUpdates: true),
            let background = card.background.createSnapshot(afterScreenUpdates: true)
                        
            else {
                transitionContext.completeTransition(true)
                return
        }
            
        let fadeAnimator = SecondVCFadeAnimator(vc: toVC)
        fadeAnimator.prepareForFadeIn()
        
        containerView.add(background, name, logo, info)
        containerView.add(fadeAnimator.snapshots)

        
        let duration = transitionDuration(using: transitionContext)
        
        UIView
            .animateKeyframes(withDuration: duration,
                              delay: 0,
                              options: .calculationModeLinear,
                              animations: { [unowned self] in
                                
                                UIView.addKeyframe(withRelativeStartTime: 0,
                                                   relativeDuration: 0.05,
                                                   animations: {
                                                    info.alpha = 0
                                })
                                
                                UIView.addKeyframe(withRelativeStartTime: 0,
                                                   relativeDuration: 0.3,
                                                   animations: { [unowned self] in
                                                    logo.frame = self.toVC.logo.globalFrame
                                                    name.frame = self.toVC.name.globalFrame
                                                    background.frame = self.toVC.view.globalFrame
                                })
                                
                                fadeAnimator.addKeyFrameFadeIn()
                                
            },
                              completion: { [unowned self] _ in
                                self.containerView
                                    .remove(
                                        logo,
                                        name,
                                        info,
                                        background
                                )
                                self.toVC.view.alpha = 1
                                self.containerView.remove(fadeAnimator.snapshots)
                                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
    }
}

