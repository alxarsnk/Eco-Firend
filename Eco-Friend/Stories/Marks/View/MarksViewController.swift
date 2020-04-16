//
//  MarksViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MarksViewController: UIViewController, MarksViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MarksViewOutput!
    var navigationBar: UINavigationBar!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureTableView()
        configureNavigationBar()
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MarksTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "marksTableViewCell")
    }
    
    private func configureNavigationBar() {
        
        navigationBar = self.navigationController?.navigationBar
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationBar.tintColor = .black
        navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Маркировка", style: .plain, target: nil, action: nil)
        navigationBar.isTranslucent = false
        navigationBar.topItem!.title = "Маркировки"
    }
   
    //MARK: - MarksViewInput
    
}

extension MarksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"marksTableViewCell", for: indexPath) as! MarksTableViewCell
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.showMarksDetail()
    }
    
    
}
