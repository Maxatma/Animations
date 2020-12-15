//
//  SecondVC.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/8/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


final class SecondVC: XibLoadedVC {
    var viewModel: SecondVM!
    
    @IBOutlet var logo: UIButton!
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var buttonsSV: UIStackView!
    @IBOutlet var othersView: UIView!
    @IBOutlet var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logo.setImage(viewModel.logo, for: .normal)
        name.text = viewModel.name
        price.text = viewModel.price
    }
    
    @IBAction func backPressed(_ sender: Any) {
        let transition = PopFromSecondToFirstAnimator()
        Router.shared.pop(transition: transition)
    }
}

