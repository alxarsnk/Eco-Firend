//
//  TrashDetailPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class TrashDetailPresenter: TrashDetailViewOutput, TrashDetailInteractorOutput {
    
    weak var view: TrashDetailViewInput!
    var interactor: TrashDetailInteractorInput!
    var router: TrashDetailRouterInput!
    
    //MARK: - TrashDetailViewOutput
    
    func setupInitialState() {
        
    }
}
