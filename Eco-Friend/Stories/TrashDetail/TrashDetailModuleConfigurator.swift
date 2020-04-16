//
//  TrashDetailModuleConfigurator.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class TrashDetailModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! TrashDetailViewController
        let presenter = TrashDetailPresenter()
        let interactor = TrashDetailInteractor()
        let router = TrashDetailRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = viewController
    }
}
