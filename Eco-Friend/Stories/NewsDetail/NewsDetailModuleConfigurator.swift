//
//  NewsDetailModuleConfigurator.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class NewsDetailModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! NewsDetailViewController
        let presenter = NewsDetailPresenter()
        let interactor = NewsDetailInteractor()
        let router = NewsDetailRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = viewController
    }
}
