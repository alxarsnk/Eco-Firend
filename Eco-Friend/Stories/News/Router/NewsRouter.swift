//
//  NewsRouter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsRouter: NewsRouterInput {
    
    weak var view: UIViewController!
    
    //MARK: - NewsRouterInput
    func showNewsDeatil(with model: NewsTableViewCellModel) {
        let vc = Navigation.getDetailScreen(storyboardName: "NewsDetail", screenName: "newsDetailViewController") as! NewsDetailViewInput
        vc.setModel(model: model)
        view.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
    
    func showFavourites() {
        let vc = Navigation.getDetailScreen(storyboardName: "News", screenName: "newsFavourite")
        view.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
}
