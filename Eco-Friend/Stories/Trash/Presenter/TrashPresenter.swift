//
//  TrashPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class TrashPresenter: TrashViewOutput, TrashInteractorOutput {
    
    weak var view: TrashViewInput!
    var interactor: TrashInteractorInput!
    var router: TrashRouterInput!
    
    //MARK: - TrashViewOutput
    
    func setupInitialState() {
        
    }
    
    func showTrashDetail() {
        router.showTrashDetail()
    }
}
