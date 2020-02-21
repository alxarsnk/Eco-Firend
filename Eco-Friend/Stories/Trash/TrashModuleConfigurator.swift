//
//  TrashModuleConfigurator.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class TrashModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! TrashViewController
        let presenter = TrashPresenter()
        let interactor = TrashInteractor()
        let router = TrashRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = viewController
    }
}
