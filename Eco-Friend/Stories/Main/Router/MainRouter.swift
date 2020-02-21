//
//  MainRouter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MainRouter: MainRouterInput {
    
    weak var view: UIViewController!
    
    //MARK: - MainRouterInput
    
    func showScreen(with tag: ScreenTags) {
        UIApplication.shared.windows.first?.rootViewController = Navigation.shared.tabBarController.showScreen(with: tag)
    }
}
