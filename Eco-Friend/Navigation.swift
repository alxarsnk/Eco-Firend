//
//  Navigation.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

public enum ScreenTags: Int {
    case news = 0
    case marks = 1
    case trash = 2
    case map = 3
}

class Navigation {

    static let shared = Navigation()
    
    var tabBarController: NavigationProtocol!
    
    private init () {
        tabBarController = TabBarViewController()
    }
    
    public static func getDetailScreen(storyboardName: String, screenName: String) -> UIViewController{
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: screenName)
        return viewController
    }
    
}
