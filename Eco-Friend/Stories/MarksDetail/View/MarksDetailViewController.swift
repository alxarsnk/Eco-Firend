//
//  MarksDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 12.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MarksDetailViewController: UIViewController, MarksDetailViewInput {
    
    var presenter: MarksDetailViewOutput!
    var navigationBar: UINavigationBar!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavifationBar()
    }
    
    private func configureNavifationBar() {
        navigationBar = self.navigationController?.navigationBar
        self.title = "Название"
    }
   
    //MARK: - MarksDetailViewInput
    
    
}
