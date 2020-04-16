//
//  MarksDetailPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 12.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class MarksDetailPresenter: MarksDetailViewOutput, MarksDetailInteractorOutput {
    
    weak var view: MarksDetailViewInput!
    var interactor: MarksDetailInteractorInput!
    var router: MarksDetailRouterInput!
    
    //MARK: - MarksDetailViewOutput
    
    func setupInitialState() {
        
    }
}
