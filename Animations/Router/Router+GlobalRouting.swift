//
//  Router+GlobalRouting.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/14/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


extension Router {
    
    func showSecond(transition: UIViewControllerAnimatedTransitioning? = nil, model: ShareProtocol) {
        let vc = SecondVC()
        self.transition = transition
        vc.viewModel = SecondVM(model: model)
        push(vc)
    }
}

