//
//  UICollection+Extensions.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 12.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


extension UICollectionView {
    
    func registerNibsFor(classes: [AnyClass]) {
        classes.forEach { (cellClass) in
            let cellId = String(describing: cellClass)
            let bundle = Bundle(for: cellClass)
            let nib    = UINib(nibName: cellId, bundle: bundle)
            self.register(nib, forCellWithReuseIdentifier: cellId)
        }
    }
}

