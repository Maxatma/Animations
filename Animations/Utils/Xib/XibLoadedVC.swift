//
//  XibLoadedVC.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 23.09.2020.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


class XibLoadedVC: UIViewController {
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
   
    required init() {
        print("init \(type(of: self))")
        let bundle = Bundle(for: type(of: self))
        super.init(nibName: String(describing: type(of: self)), bundle: bundle)
    }
}

