//
//  NewsViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, NewsViewInput {
    
    var presenter: NewsViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }
   
    //MARK: - NewsViewInput
    
    
}
