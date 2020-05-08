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
    
    func showTrashDetail(withModel: Trash) {
        router.showTrashDetail(withModel: withModel)
    }
    
    func loadTrash() {
        interactor.loadTrash()
    }
    
    func getTrashCount() -> Int {
        return interactor.getTrashCount()
    }
    
    func getTrash(at index: Int) -> Trash {
        return interactor.getTrash(at: index)
    }
    
    func successful() {
        view.updateView()
    }
    
    func unsucessful(errorString: String) {
        view.showError(errorString: errorString)
    }
}
