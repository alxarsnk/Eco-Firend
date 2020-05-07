//
//  MarksRouter.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class MarksRouter: MarksRouterInput {
    
    weak var view: UIViewController!
    
    //MARK: - MarksRouterInput
    
    func showMarksDetail(with model: Mark) {
        let vc = Navigation.getDetailScreen(storyboardName: "MarksDetail", screenName: "marksDetailViewController") as! MarksDetailViewController
        vc.model = model
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
}
