//
//  Global.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 08.12.2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class Global {
    
    static let shared = Global()
    
    public let screenSize: CGSize  = {
        return UIScreen.main.bounds.size
    }()

    public struct Services {
        static let networkService = NetworkService()
    }
    
    public struct Colors {
        static let lightGreen = UIColor(hex: "82DC9B")
        static let lightGray = UIColor(hex: "f2f2f2")
    }
}
