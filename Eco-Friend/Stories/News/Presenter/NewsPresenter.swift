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
}
