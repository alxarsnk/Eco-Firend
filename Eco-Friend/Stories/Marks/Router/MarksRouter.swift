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
    
    func showMarksDetail() {
        let vc = Navigation.getDetailScreen(storyboardName: "MarksDetail", screenName: "marksDetailViewController")
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
}
