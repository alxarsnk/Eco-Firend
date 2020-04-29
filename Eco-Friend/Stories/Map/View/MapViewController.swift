//
//  MapViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 09.12.2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit
import WebKit
class MapViewController: UIViewController, MapViewInput {
    
    var presenter: MapViewOutput!
    @IBOutlet weak var webkitView: WKWebView!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
        webkitView.backgroundColor = .white
        webkitView.load(URLRequest(url: URL(string: "https://recyclemap.ru")!))
        self.navigationController?.navigationBar.isHidden = true
    }
   
    //MARK: - MapViewInput
    
    
}
