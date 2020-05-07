//
//  MarksDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 12.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MarksDetailViewController: UIViewController, MarksDetailViewInput {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    var presenter: MarksDetailViewOutput!
    var navigationBar: UINavigationBar!
    var model: Mark!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavifationBar()
        imageView.sd_setImage(with: URL(string: model.imageURL), completed: nil)
        textLabel.text = model.text
    }
    
    private func configureNavifationBar() {
        navigationBar = self.navigationController?.navigationBar
        self.title = model.id
    }
   
    //MARK: - MarksDetailViewInput
    
    
}
