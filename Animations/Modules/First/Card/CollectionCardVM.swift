//
//  CollectionCardVM.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 11.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit.UIImage



final class CollectionCardVM {
    var model: ShareProtocol!
    var logo: UIImage!
    var name: String!
    var info: String!
    
    init(model: ShareProtocol) {
        self.model = model
        logo = UIImage(named: model.logo)
        name = model.name
        info = model.tag
    }
}

