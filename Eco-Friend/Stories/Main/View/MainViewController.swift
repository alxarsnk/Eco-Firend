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
    

    @IBOutlet weak var tableView: UITableView!
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavigationBar()
        configureTableView()
    }
    
    private func configureNavigationBar() {
        
        navigationBar = self.navigationController?.navigationBar
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }
    //MARK: - MainViewInput
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath)
        
        let contentView = UIView(frame: .zero)
        contentView.frame.size = CGSize(width: cell.frame.size.width - 32, height: 48)
        cell.addSubview(contentView)
        contentView.center = cell.contentView.center
        contentView.backgroundColor = Global.Colors.lightGreen
        contentView.layer.cornerRadius = 10
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.4
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 3
        
        let screenTag = ScreenTags(rawValue: indexPath.row)!
        var title: String = ""
        switch screenTag {
        case .map:
            title = "Куда везти мусор"
        case .marks:
            title = "Хочу разобраться в маркировках"
        case .news:
            title = "Хочу узнать что-то новое"
        case .trash:
            title = "Как подготовить к сдаче мусор"
        }
        let titleLabel = UILabel(frame: .zero)
        titleLabel.frame.size = contentView.frame.size
        titleLabel.textAlignment = .center
        titleLabel.text = title
        contentView.addSubview(titleLabel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screenTag = ScreenTags(rawValue: indexPath.row)!
        presenter.showScreen(with: screenTag)
    }
}
