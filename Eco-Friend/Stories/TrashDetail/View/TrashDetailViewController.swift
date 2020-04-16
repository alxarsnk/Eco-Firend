//
//  TrashDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class TrashDetailViewController: UIViewController, TrashDetailViewInput {
    
    var presenter: TrashDetailViewOutput!
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
    //MARK: - TrashDetailViewInput
    
    
}
