//
//  TrashViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class TrashViewController: UIViewController, TrashViewInput {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TrashViewOutput!
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
        let nib = UINib(nibName: "TrashTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "trashTableViewCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = Global.Colors.lightGray
    }
    
    private func configureNavigationBar() {
        
        navigationBar = self.navigationController?.navigationBar
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationBar.tintColor = .black
        navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Сортировка", style: .plain, target: nil, action: nil)
        navigationBar.isTranslucent = false
        navigationBar.topItem!.title = "Сортировка мусора"
    }
    //MARK: - TrashViewInput
}
var dataSource: [String] {
    return ["Стекло", "Бумага", "Батарейки", "Картон", "Жестяные изделия", "Пластик", "Органические отходы"]
}
extension TrashViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "trashTableViewCell", for: indexPath) as! TrashTableViewCell
        cell.nameLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showTrashDetail()
    }
}
