//
//  MarksViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import SDWebImage

class MarksViewController: UIViewController, MarksViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: MarksViewOutput!
    var navigationBar: UINavigationBar!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startLoading()
        presenter.setupInitialState()
        configureTableView()
        configureNavigationBar()
    }
    
    private func startLoading() {
        presenter.fetchMarks()
        activityIndicator.startAnimating()
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MarksTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "marksTableViewCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = Global.Colors.lightGray
        tableView.isHidden = false
    }
    
    private func configureNavigationBar() {
        
       navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGray!)
        navigationBar = self.navigationController?.navigationBar
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Маркировка", style: .plain, target: nil, action: nil)
        navigationBar.isTranslucent = false
        navigationBar.topItem!.title = "Маркировки"
        navBarIsHidden(true)
    }
    
    private func navBarIsHidden(_ isHidden: Bool) {
        navigationBar.isHidden = isHidden
        if !isHidden {
            navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
        }
    }
   
    //MARK: - MarksViewInput
    
    func updateView() {
        tableView.isHidden = false
        navBarIsHidden(false)
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
    func reloadRows(at indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .fade)
    }

    
    func showError(errorString: String) {
        activityIndicator.stopAnimating()
        let alertController = UIAlertController(title: "Error", message: errorString, preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.startLoading()
        }
        alertController.addAction(alerAction)
        present(alertController, animated: true, completion: nil)
        
    }
}

extension MarksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getMarksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"marksTableViewCell", for: indexPath) as! MarksTableViewCell
        let cellModel = presenter.getMark(at: indexPath.row)
        cell.baseViewController = self
        cell.indexPath = indexPath
        cell.configure(with: cellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cellModel = presenter.getMark(at: indexPath.row)
        presenter.showMarksDetail(with: cellModel)
    }
}
