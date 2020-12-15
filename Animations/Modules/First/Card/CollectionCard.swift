//
//  CollectionCard.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/8/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


final class CollectionCard: UICollectionViewCell {
    
    @IBOutlet var background: UIView!
    @IBOutlet var logo: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var info: UILabel!
    
    func configureWithVM(viewModel: CollectionCardVM) {
        logo.setImage(viewModel.logo, for: .normal)
        name.text = viewModel.name
        info.text = viewModel.info
    }
}

