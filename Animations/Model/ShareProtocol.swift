//
//  CoinModel.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 11.10.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


protocol ShareProtocol {
    var name: String { get set }
    var logo: String { get set }
    var price: String { get set }
    var tag: String { get set }
}


struct AmazonShare: ShareProtocol {
    var name = "amazon"
    var logo = "amazon"
    var price: String = "3289$"
    var tag: String = "AMZN"
}

struct AppleShare: ShareProtocol {
    var name = "apple"
    var logo = "apple"
    var price: String = "117$"
    var tag: String = "AAPL"
}

struct TeslaShare: ShareProtocol {
    var name = "tesla"
    var logo = "tesla"
    var price: String = "433$"
    var tag: String = "TSLA"
}

struct FacebookShare: ShareProtocol {
    var name = "facebook"
    var logo = "facebook"
    var price: String = "264$"
    var tag: String = "FB"
}

struct TwitterShare: ShareProtocol {
    var name = "twitter"
    var logo = "twitter"
    var price: String = "46$"
    var tag: String = "TWTR"
}
