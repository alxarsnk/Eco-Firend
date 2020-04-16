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
    
    var webView: WKWebView!
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
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        configureNavigationController()
        configureWebKit()
        configureTableView()
        screenState = .waiting
    }
    
    private func configureWaitingState() {
        navBarIsHidden(true)
        startAnimating()
        webView.isHidden = true
        tableView.isHidden = true
    }
    
    private func configureSuccessState() {
        navBarIsHidden(false)
        stopAnimating()
        webView.isHidden = true
        tableView.isHidden = false
    }
    
    private func configureErrorState() {
        navBarIsHidden(false)
        stopAnimating()
        webView.isHidden = true
        let errorView = UIView(frame: CGRect())
        errorView.center = view.center
        errorView.frame.size = CGSize(width: 100, height: 50)
        errorView.backgroundColor = .red
        view.addSubview(errorView)
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)

    }
    
    private func navBarIsHidden(_ isHidden: Bool) {
        navigationBar.isHidden = isHidden
        if !isHidden {
            navigationController?.setStatusBar(backgroundColor: Global.Colors.lightGreen!)
        }
    }
    
    private func configureWebKit() {
        webView = WKWebView()
        webView.frame = view.frame
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.isHidden = true
        makeRequest(with: presenter.getAuthURL())
    }
    
    private func makeRequest(with url: URL) {
        webView.load(URLRequest(url: url))
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
    
    func updateView() {
        screenState = .success
        tableView.reloadData()
    }
    
    func addToFavourites(at indexPath: IndexPath) {
        
    }
}

//MARK: - WKNavigationDelegate
extension NewsViewController: WKNavigationDelegate {

   func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation:
    WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        self.screenState = .error
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation:
    WKNavigation!) {
        print("Strat to load")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
        if webView.url?.absoluteString.range(of: "access_token") != nil {
            if let token = webView.url?.absoluteString.slice(from: "access_token=", to: "&") {
                presenter.requsetData(with: token)
                self.screenState = .waiting
            } else {
                print("не получается")
            }
        } else if webView.url?.absoluteString.range(of: "error") != nil {
            self.screenState = .error
        } else {
            webView.isHidden = false
            if webView.url == URL(string: "https://api.vkontakte.ru/blank.html") {
                 makeRequest(with: presenter.getAuthURL())
            }
        }
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
