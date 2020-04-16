//
//  NewsDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, NewsDetailViewInput {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var model: NewsTableViewCellModel!
    var presenter: NewsDetailViewOutput!
    var navigationBar: UINavigationBar!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = model.text
        presenter.setupInitialState()
        configureNavifationBar()
    }
        
    private func configureNavifationBar() {
        navigationBar = self.navigationController?.navigationBar
        self.title = "Название"
    }
    
    //MARK: - NewsDetailViewInput
    
    func setModel(model: NewsTableViewCellModel) {
        self.model = model
    }
    
}
