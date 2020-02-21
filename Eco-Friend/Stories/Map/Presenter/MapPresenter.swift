//
//  MapPresenter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 09.12.2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class MapPresenter: MapViewOutput, MapInteractorOutput {
    
    weak var view: MapViewInput!
    var interactor: MapInteractorInput!
    var router: MapRouterInput!
    
    //MARK: - MapViewOutput
    
    func setupInitialState() {
        
    }
}
