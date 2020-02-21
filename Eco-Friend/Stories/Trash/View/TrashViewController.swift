//
//  TrashViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class TrashViewController: UIViewController, TrashViewInput {
    
    var presenter: TrashViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }
   
    //MARK: - TrashViewInput
    
    
}
