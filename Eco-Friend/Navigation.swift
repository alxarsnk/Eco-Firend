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
    case map = 4
}

class Navigation {

    static let shared = Navigation()
    
    var tabBarController: NavigationProtocol!
    
    private init () {
        tabBarController = TabBarViewController()
    }
    
}
