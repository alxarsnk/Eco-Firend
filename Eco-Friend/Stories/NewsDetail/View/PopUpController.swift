//
//  PopUpController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 18.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class PopUpController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var dismisGestureRecognizer: UITapGestureRecognizer!
    var imagesURL: [URL]!
    var indexPath: IndexPath!
    var rootVieController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 30
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "newsDetailCollectionViewCell")
        
        
        dismisGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissScreen))
        dismisGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(dismisGestureRecognizer)
    }
    
    @objc func dismissScreen() {
        self.dismiss(animated: true, completion: nil)
        let vc = rootVieController as! NewsDetailViewController
        vc.fadeView.isHidden = true
        vc.tabBarFadeView.isHidden = true
    }
}


extension PopUpController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsDetailCollectionViewCell", for: indexPath) as! NewsDetailCollectionViewCell
        let imageURL = imagesURL![indexPath.row]
        cell.configureCell(withURL: imageURL, and: .popup)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.height)
    }
}

extension PopUpController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print(gestureRecognizer.view.self)
        return true
    }
}
