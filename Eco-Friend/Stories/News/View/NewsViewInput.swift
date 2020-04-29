//
//  NewsViewInput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol NewsViewInput: AnyObject {
    
    func startAnimating()
    
    func stopAnimating()
    
    func successUpdateView()
    
    func failureUpdateView()
}

protocol NewsViewFromCellInput: AnyObject {

    func addToFavourites(at indexPath: IndexPath)
    
    func removeFromFavourites(at indexPath: IndexPath)
    
    func reloadRow(at indexPaths: [IndexPath])
}

extension NewsViewFromCellInput {
    
    func addToFavourites(at indexPath: IndexPath) {
        print("override me")
    }
    
    func removeFromFavourites(at indexPath: IndexPath) {
        print("override me")
    }
}
