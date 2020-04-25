//
//  NewsViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit
import WebKit

enum NewsScreenState {
    case waiting
    case success
    case error
}

class NewsViewController: UIViewController, NewsViewInput, NewsViewFromCellInput {
    
    var navigationBar: UINavigationBar!
    var presenter: NewsViewOutput!
    var screenState: NewsScreenState! {
        willSet {
            switch newValue {
            case .waiting:
                configureWaitingState()
            case .success:
                configureSuccessState()
            case .error:
                configureErrorState()
            case .none:
                print("none")
            }
        }
    }
    

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let errorLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    let errorButton =  UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.requsetData()
        presenter.setupInitialState()
        configureNavigationController()
        configureTableView()
        configureErrorUI()
        screenState = .waiting
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    private func configureErrorUI() {
        
        
        errorLabel.center = CGPoint(x: view.center.x, y: view.center.y - 200)
        errorLabel.text = "Ошибка авторизации"
        errorLabel.textColor = .black
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont.systemFont(ofSize: 21, weight: .semibold)
        errorLabel.isHidden = true
        errorButton.setTitle("Очистить cookie", for: .normal)
        errorButton.center = CGPoint(x: view.center.x, y: view.center.y - 100)
        errorButton.layer.cornerRadius = 25
        errorButton.backgroundColor = Global.Colors.lightGreen
        errorButton.setTitleColor(.black, for: .normal)
        errorButton.addTarget(self, action: #selector(clearCookie), for: .touchUpInside)
        errorButton.isHidden = true
        view.addSubview(errorLabel)
        view.addSubview(errorButton)
    }
    
    private func configureWaitingState() {
        
        navBarIsHidden(true)
        startAnimating()
        tableView.isHidden = true
    }
    
    private func configureSuccessState() {
        
        navBarIsHidden(false)
        stopAnimating()
        tableView.isHidden = false
    }
    
    private func configureErrorState() {
        
        navBarIsHidden(false)
        stopAnimating()
        errorLabel.isHidden = false
        errorButton.isHidden = false
        tableView.isHidden = true
    }

    private func configureNavigationController() {
    
        navigationBar = self.navigationController?.navigationBar
        navigationBar.prefersLargeTitles = true
        navigationBar.backgroundColor = Global.Colors.lightGreen
        navigationBar.barTintColor = Global.Colors.lightGreen
        navigationBar.tintColor = .black
        navigationBar.isTranslucent = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Новости", style: .plain, target: self, action: nil)
        navigationBar.topItem!.title = "Новости"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(showFavouritesPage))

    }
    
    private func navBarIsHidden(_ isHidden: Bool) {
        navigationBar.isHidden = isHidden
        if !isHidden {
            navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
        }
    }

    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "newsTableViewCell")
    }
   
    //MARK: - NewsViewInput
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    func successUpdateView() {
        screenState = .success
        tableView.reloadData()
    }
    
    func failureUpdateView() {
        screenState = .error
    }
    
    //MARK: - NewsViewFromCellInput
    func addToFavourites(at indexPath: IndexPath) {
        presenter.addToFavourites(at: indexPath)
        tableView.reloadData()
    }
    
    func removeFromFavourites(at indexPath: IndexPath) {
        presenter.removeFromFavourites(at: indexPath)
        tableView.reloadData()
    }
    
    //MARK: - OBJC
    
    @objc private func showFavouritesPage() {
        presenter.showFavouritesPage()
    }
    
    @objc private func clearCookie() {
        presenter.clearCookie()
        errorButton.isHidden = true
        errorLabel.isHidden = true
        
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getPostsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsTableViewCell") as? NewsTableViewCell
        let model = presenter.getCellModel(at: indexPath.row)
        cell?.indexPath = indexPath
        cell?.viewController = self
        cell?.configure(with: model)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let model = presenter.getCellModel(at: indexPath.row)
        presenter.showNewsDeatil(with: model)
    }
   
}
