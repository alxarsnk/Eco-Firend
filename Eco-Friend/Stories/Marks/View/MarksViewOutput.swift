//
//  MarksViewOutput.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol MarksViewOutput: AnyObject {
    
    func setupInitialState()
    
    func showMarksDetail(with model: Mark)
    
    func getMark(at index: Int) -> Mark
    
    func getMarksCount() -> Int
    
    func fetchMarks()
}
