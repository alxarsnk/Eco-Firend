//
//  NewsDetailPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class NewsDetailPresenter: NewsDetailViewOutput, NewsDetailInteractorOutput {
    
    weak var view: NewsDetailViewInput!
    var interactor: NewsDetailInteractorInput!
    var router: NewsDetailRouterInput!
    
    //MARK: - NewsDetailViewOutput
    
    func setupInitialState() {
        
    }
}
