//
//  NewsDetailViewInput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol NewsDetailViewInput: AnyObject {
    
    func setModel(model: NewsTableViewCellModel)
}
