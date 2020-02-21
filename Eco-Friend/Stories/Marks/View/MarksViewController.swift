//
//  MarksViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MarksViewController: UIViewController, MarksViewInput {
    
    var presenter: MarksViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }
   
    //MARK: - MarksViewInput
    
    
}
