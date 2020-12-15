//
//  ViewController.swift
//  Animations
//
//  Created by Zaporozhchenko Oleksandr on 4/8/20.
//  Copyright © 2020 maxatma. All rights reserved.
//

import UIKit


final class FirstVC: XibLoadedVC {
    var viewModel: FirstVM!
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNibsFor(classes: [CollectionCard.self])
    }
}

extension FirstVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let transition = PushFromFirstToSecondAnimator()
        Router.shared.showSecond(transition: transition, model: viewModel.vms[indexPath.row].model)
    }
}

extension FirstVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.vms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCard",
                                                      for: indexPath as IndexPath) as! CollectionCard
        let vm = viewModel.vms[indexPath.row]
        cell.configureWithVM(viewModel: vm)
        return cell
    }
}

