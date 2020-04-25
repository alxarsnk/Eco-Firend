//
//  NewsFavouriteViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 16.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsFavouriteViewController: UIViewController, NewsViewFromCellInput {

    @IBOutlet weak var tableView: UITableView!
    
    var dataManager: DataManagerProtocol = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Избранное", style: .plain, target: self, action: nil)
        self.title = "Избранное"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(hex: "f2f2f2")
        tableView.separatorStyle = .none
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "newsTableViewCell")
    }
    
    func removeFromFavourites(at indexPath: IndexPath) {
        dataManager.removePostFromFavourites(at: indexPath.row)
        tableView.reloadData()
    }
    
}

extension NewsFavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.getFavouritePostsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableViewCell") as? NewsTableViewCell
        let model = dataManager.getFavouritePost(at: indexPath.row)
        cell?.indexPath = indexPath
        cell?.viewController = self
        cell?.configure(with: model)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = dataManager.getFavouritePost(at: indexPath.row)
        let vc = Navigation.getDetailScreen(storyboardName: "NewsDetail", screenName: "newsDetailViewController") as! NewsDetailViewInput
        vc.setModel(model: model)
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
}
