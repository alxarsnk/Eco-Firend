//
//  TrashDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.03.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import SDWebImage

class TrashDetailViewController: UIViewController, TrashDetailViewInput {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var presenter: TrashDetailViewOutput!
    var navigationBar: UINavigationBar!
    var trashModel: Trash!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavifationBar()
        configureView()
    }
    
    private func configureNavifationBar() {
        navigationBar = self.navigationController?.navigationBar
        self.title = trashModel.name
    }
    
    private func configureView() {
        imageView.sd_setImage(with: URL(string: trashModel.imageURL), completed: nil)
        textLabel.text = trashModel.text
    }
    //MARK: - TrashDetailViewInput
    
    
}
