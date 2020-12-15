//
//  FirstVM.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 11.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import Foundation


final class FirstVM {
   static let items: [ShareProtocol] = [AmazonShare(),
                                  AppleShare(),
                                  TeslaShare(),
                                  FacebookShare(),
                                  TwitterShare()]
    
    let vms = items.map { CollectionCardVM(model: $0) }
    
}
