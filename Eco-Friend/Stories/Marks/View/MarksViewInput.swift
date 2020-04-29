//
//  MarksViewInput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol MarksViewInput: AnyObject {
    
    func updateView()
    
    func showError(errorString: String)
    
    func reloadRows(at indexPaths: [IndexPath])
}
