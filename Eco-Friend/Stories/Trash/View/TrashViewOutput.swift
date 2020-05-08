//
//  TrashViewOutput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol TrashViewOutput: AnyObject {
    
    func setupInitialState()
    
    func showTrashDetail(withModel: Trash)
    
    func loadTrash()
    
    func getTrashCount() -> Int
    
    func getTrash(at index: Int) -> Trash
}
