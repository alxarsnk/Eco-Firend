//
//  MarksPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

class MarksPresenter: MarksViewOutput, MarksInteractorOutput {
    
    weak var view: MarksViewInput!
    var interactor: MarksInteractorInput!
    var router: MarksRouterInput!
    
    //MARK: - MarksViewOutput
    
    func setupInitialState() {
        
    }
    
    func showMarksDetail(with model: Mark) {
        router.showMarksDetail(with: model)
    }
    
    func getMark(at index: Int) -> Mark {
        return interactor.getMark(at: index)
    }
    
    func getMarksCount() -> Int {
        return interactor.getMarksCount()
    }
    
    func fetchMarks() {
        interactor.fetchMarks()
    }
     
    func successful() {
        view.updateView()
    }
    
    func unsucessful(errorString: String) {
        view.showError(errorString: errorString)
    }
}
