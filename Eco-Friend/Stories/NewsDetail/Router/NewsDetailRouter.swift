//
//  NewsDetailRouter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsDetailRouter: NewsDetailRouterInput {
    
    weak var view: UIViewController!
    
    //MARK: - NewsDetailRouterInput
    
    func showCollection(withImagesURL imagesURL: [URL], at indexPath: IndexPath) {
        
        let vc = Navigation.getDetailScreen(storyboardName: "NewsDetail", screenName: "popUpCollection") as! PopUpController
        vc.imagesURL = imagesURL
        vc.indexPath = indexPath
        vc.rootVieController = view
        vc.modalPresentationStyle = .overCurrentContext
        view.present(vc, animated: true, completion: nil)
    }
}
