//
//  TabBarViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

protocol NavigationProtocol {
    
    func showScreen(with tag: ScreenTags) -> UIViewController
}

class TabBarViewController: UITabBarController, NavigationProtocol {
    
    var newsViewController: NewsViewInput!
    var marksViewController: MarksViewInput!
    var trashViewController: TrashViewInput!
    var mapViewController: MapViewInput!
    
    override func viewDidLoad() {
        
        let newsStoryboard = UIStoryboard(name: "News", bundle: nil)
        let marksStoryboard = UIStoryboard(name: "Marks", bundle: nil)
        let trashStoryboard = UIStoryboard(name: "Trash", bundle: nil)
        let mapStoryboard = UIStoryboard(name: "Map", bundle: nil)
        
        
        newsViewController = newsStoryboard.instantiateViewController(withIdentifier: "news") as? NewsViewInput
        (newsViewController as! UIViewController).tabBarItem = UITabBarItem(title: "News", image: nil, tag: 0)
        
        marksViewController = marksStoryboard.instantiateViewController(withIdentifier: "marks") as? MarksViewInput
        (marksViewController as! UIViewController).tabBarItem = UITabBarItem(title: "Marks", image: nil, tag: 1)
        
        trashViewController = trashStoryboard.instantiateViewController(withIdentifier: "trash") as? TrashViewInput
        (trashViewController as! UIViewController).tabBarItem = UITabBarItem(title: "Trash", image: nil, tag: 2)
        
        mapViewController = mapStoryboard.instantiateViewController(withIdentifier: "map") as? MapViewInput
        (mapViewController as! UIViewController).tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 4)
        
        self.viewControllers = [newsViewController as! UIViewController, marksViewController as! UIViewController, trashViewController as! UIViewController, mapViewController as! UIViewController]
    }
    
    func showScreen(with tag: ScreenTags) -> UIViewController {
        selectedIndex = tag.rawValue
        return self
    }
}
