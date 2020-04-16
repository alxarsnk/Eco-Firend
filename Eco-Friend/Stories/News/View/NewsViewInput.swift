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
    
    func updateView()
}

protocol NewsViewFromCellInput: AnyObject {

    func addToFavourites(at indexPath: IndexPath)
}
