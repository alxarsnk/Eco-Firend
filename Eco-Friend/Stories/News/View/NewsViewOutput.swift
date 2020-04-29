//
//  NewsViewOutput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol NewsViewOutput: AnyObject {
    
    func setupInitialState()
    
    func requsetData()
    
    func getPostsCount() -> Int
    
    func getCellModel(at index: Int) -> NewsTableViewCellModel
    
    func showNewsDeatil(with model: NewsTableViewCellModel)
    
    func addToFavourites(at indexPath: IndexPath)
    
    func removeFromFavourites(at indexPath: IndexPath)
    
    func showFavouritesPage()
    
    func clearCookie() 
}
