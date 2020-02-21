//
//  MainPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class MainPresenter: MainViewOutput, MainInteractorOutput {
    
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!
    
    //MARK: - MainViewOutput
    
    func setupInitialState() {
        
    }
}
