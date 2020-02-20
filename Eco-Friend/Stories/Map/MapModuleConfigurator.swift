//
//  MapModuleConfigurator.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 09.12.2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class MapModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! MapViewController
        let presenter = MapPresenter()
        let interactor = MapInteractor()
        let router = MapRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = viewController
    }
}
