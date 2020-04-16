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
        
        tabBar.barTintColor = Global.Colors.lightGreen
        tabBar.tintColor = UIColor.black
        
        let newsStoryboard = UIStoryboard(name: "News", bundle: nil)
        let marksStoryboard = UIStoryboard(name: "Marks", bundle: nil)
        let trashStoryboard = UIStoryboard(name: "Trash", bundle: nil)
        let mapStoryboard = UIStoryboard(name: "Map", bundle: nil)
        
        newsViewController = newsStoryboard.instantiateViewController(withIdentifier: "news") as? NewsViewInput
        marksViewController = marksStoryboard.instantiateViewController(withIdentifier: "marks") as? MarksViewInput
        trashViewController = trashStoryboard.instantiateViewController(withIdentifier: "trash") as? TrashViewInput
        mapViewController = mapStoryboard.instantiateViewController(withIdentifier: "map") as? MapViewInput
        
        
        self.viewControllers = [newsViewController as! UIViewController, marksViewController as! UIViewController, trashViewController as! UIViewController, mapViewController as! UIViewController].map{ UINavigationController(rootViewController: $0) }
        
        (newsViewController as! UIViewController).navigationController?.tabBarItem = UITabBarItem(title: "Новости", image: UIImage(named: "tb_news_ic"), tag: 0)
        (marksViewController as! UIViewController).navigationController?.tabBarItem = UITabBarItem(title: "Маркировки", image: UIImage(named: "tb_marks_ic"), tag: 1)
        (trashViewController as! UIViewController).navigationController?.tabBarItem = UITabBarItem(title: "Сортировка", image: UIImage(named: "tb_trash_ic"), tag: 2)
        (mapViewController as! UIViewController).navigationController?.tabBarItem = UITabBarItem(title: "Карта", image: UIImage(named: "tb_map_ic"), tag: 4)
    }
    
    func showScreen(with tag: ScreenTags) -> UIViewController {
        selectedIndex = tag.rawValue
        return self
    }
}
