//
//  MarksInteractorInput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol MarksInteractorInput: AnyObject {
    
    func getMark(at index: Int) -> Mark
    
    func getMarksCount() -> Int
    
    func fetchMarks()
}
