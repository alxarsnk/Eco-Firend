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
    
    func requsetData(with token: String) {
        interactor.requsetData(with: token)
    }
    
    func getPostsCount() -> Int {
        return interactor.getPostsCount()
    }
    
    func getCellModel(at index: Int) -> NewsTableViewCellModel {
        return interactor.getCellModel(at: index)
    }
    
    func getAuthURL() -> URL {
        return interactor.getAuthURL()
    }
    
    //MARK: - NewsInteractorOutput
    func updateView() {
        view.updateView()
    }
    
    func showNewsDeatil(with model: NewsTableViewCellModel) {
        router.showNewsDeatil(with: model)
    }
}
