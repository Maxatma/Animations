//
//  XibLoadableView.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/8/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


class XibLoadedView: UIView {
    
    func xibSetup() {
        let view = self.loadFromNib()
        self.addSubview(view)
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        setNeedsLayout()
        layoutIfNeeded()
    }
    
    var nibname: String {
        return String(describing: type(of: self))
    }
    
    func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib    = UINib(nibName: nibname, bundle: bundle)
        let view   = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.xibSetup()
    }
}

