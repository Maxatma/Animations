//
//  SecondVCFadeAnimator.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 28.09.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


final class SecondVCFadeAnimator: BasicFadeAnimator {
    private var price: UIView!
    private var buttons: UIView!
    private var others: UIView!
    private var back: UIView!
    
    init(vc: SecondVC) {
        super.init()
        
        price = vc.price?.createSnapshot(afterScreenUpdates: true)
        buttons = vc.buttonsSV?.createSnapshot(afterScreenUpdates: true)
        others = vc.othersView?.createSnapshot(afterScreenUpdates: true)
        back = vc.back?.createSnapshot(afterScreenUpdates: true)
        
        snapshotsFromBot = [
            price,
            buttons,
            others,
        ]
        
        snapshotsFromTop = [
            back
        ]
        
        snapshots = snapshotsFromBot + snapshotsFromTop
    }

    
    func addKeyFrameFadeIn() {
        
        UIView.addKeyframe(withRelativeStartTime: 0.2,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeInFromBot(views:
                                self.price
                            )
        })
        
        UIView.addKeyframe(withRelativeStartTime: 0.3,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeInFromBot(views:
                                self.buttons
                            )
        })
        
        UIView.addKeyframe(withRelativeStartTime: 0.4,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                                                        
                            self.fadeInFromBot(views:
                                self.others
                            )
        })
        
        UIView.addKeyframe(withRelativeStartTime: 0,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                                                        
                            self.fadeInFromTop(views:
                                self.back
                            )
        })
    }
    
    func addKeyFrameFadeOut() {
        UIView.addKeyframe(withRelativeStartTime: 0.3,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeOutFromBot(views:
                                self.price
                            )
        })
        
        UIView.addKeyframe(withRelativeStartTime: 0.2,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeOutFromBot(views:
                                self.buttons
                            )
        })
        
        UIView.addKeyframe(withRelativeStartTime: 0.1,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeOutFromBot(views:
                                self.others
                            )
        })

        
        UIView.addKeyframe(withRelativeStartTime: 0,
                           relativeDuration: 0.3,
                           animations: { [unowned self] in
                            
                            self.fadeOutFromTop(views:
                                self.back
                            )
        })
    }
}


