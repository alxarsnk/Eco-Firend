//
//  MainViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {
    
    var presenter: MainViewOutput!
    var navigationBar: UINavigationBar!
    
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var marksButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavigationBar()
        configureButtons()
    }
    
    private func configureNavigationBar() {
        
        navigationBar = self.navigationController?.navigationBar
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
    }
    
    private func configureButtons() {
        
        newsButton.layer.cornerRadius = 10
        marksButton.layer.cornerRadius = 10
        trashButton.layer.cornerRadius = 10
        mapButton.layer.cornerRadius = 10
    }
    
    //MARK: - Actions
    
    @IBAction func newsButtonPressed(_ sender: Any) {
        presenter.showScreen(with: .news)
    }
    
    @IBAction func marksButtonPressed(_ sender: Any) {
        presenter.showScreen(with: .marks)
    }
    
    @IBAction func trashButtonPressed(_ sender: Any) {
        presenter.showScreen(with: .trash)
    }
    
    @IBAction func mapButtonPressed(_ sender: Any) {
        presenter.showScreen(with: .map)
    }
    //MARK: - MainViewInput
    
}
