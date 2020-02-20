//
//  MapViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 09.12.2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, MapViewInput {
    
    var presenter: MapViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }
   
    //MARK: - MapViewInput
    
    
}
