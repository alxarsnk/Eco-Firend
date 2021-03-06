//
//  MainModuleConfigurator.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class MainModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! MainViewController
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = viewController
    }
}
