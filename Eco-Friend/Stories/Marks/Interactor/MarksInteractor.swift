//
//  MarksInteractor.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class Mark {
    
    var id: String
    var number: Int
    var name: String
    var iconURL: String
    var imageURL: String
    var text: String
    
    init(id: String, number: Int, name: String, iconURL: String, imageURL: String, text: String) {
        self.id = id
        self.number = number
        self.name = name
        self.imageURL = imageURL
        self.text = text
        self.iconURL = iconURL
    }
}

class MarksInteractor: MarksInteractorInput {

    var presenter: MarksInteractorOutput!
    var marks: [Mark] = []
    
    //MARK: - MarksInteractorInput
    
    func getMark(at index: Int) -> Mark {
        return marks[index]
    }
    
    func getMarksCount() -> Int {
        return marks.count
    }
    
    func fetchMarks() {
        Global.Services.networkService.getMarks { [weak self] (responce, errorString) -> (Void) in
            guard let blockSelf = self else { return }
            if errorString != nil {
                blockSelf.presenter.unsucessful(errorString: errorString!)
            } else if responce != nil && errorString == nil {
                blockSelf.decodeJSON(from: responce!)
                blockSelf.presenter.successful()
            }
        }
    }
    
    func decodeJSON(from data: Data) {
        
        guard let JSON = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String: Any]] else { return }
        for mark in JSON {
            guard let text = mark["text"] as? String else { return }
            guard let id = mark["id"] as? String else { return }
            guard let number = mark["number"] as? Int else { return }
            guard let name = mark["name"] as? String else { return }
            guard let imageURL = mark["image_URL"] as? String else { return }
            guard let iconURL = mark["icon_URL"] as? String else { return }
            
            let markModel = Mark(id: id, number: number, name: name, iconURL: iconURL, imageURL: imageURL, text: text)
            marks.append(markModel)
        }
      
    }
}
