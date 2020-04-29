//
//  NewsPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class NewsPresenter: NewsViewOutput, NewsInteractorOutput {
    
    weak var view: NewsViewInput!
    var interactor: NewsInteractorInput!
    var router: NewsRouterInput!
    
    //MARK: - NewsViewOutput
    
    func setupInitialState() {
        
    }
    
    func requsetData() {
        interactor.requsetData()
    }
    
    func getPostsCount() -> Int {
        return interactor.getPostsCount()
    }
    
    func getCellModel(at index: Int) -> NewsTableViewCellModel {
        return interactor.getCellModel(at: index)
    }
    
    func addToFavourites(at indexPath: IndexPath) {
        interactor.addToFavourites(at: indexPath)
    }
    
    func removeFromFavourites(at indexPath: IndexPath) {
        interactor.removeFromFavourites(at: indexPath)
    }
    
    func showFavouritesPage() {
        router.showFavourites()
    }
    
    func clearCookie() {
        interactor.clearCookie()
    }
    
    //MARK: - NewsInteractorOutput
    func successUpdateView() {
        view.successUpdateView()
    }
    
    func failureUpdateView() {
        view.failureUpdateView()
    }
    
    func showNewsDeatil(with model: NewsTableViewCellModel) {
        router.showNewsDeatil(with: model)
    }
}
