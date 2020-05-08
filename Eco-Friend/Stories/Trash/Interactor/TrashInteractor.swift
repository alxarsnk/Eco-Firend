//
//  TrashInteractor.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class Trash {

    var name: String
    var text: String
    var imageURL: String
    
    init(name: String, text: String, imageURL: String = "") {
        self.name = name
        self.text = text
        self.imageURL = imageURL
    }
}

class TrashInteractor: TrashInteractorInput {
    
    var presenter: TrashInteractorOutput!
    var trash: [Trash] = []
    
    
    //MARK: - TrashInteractorInput
    
    func loadTrash() {
        Global.Services.networkService.getTarsh { [weak self] (responce, errorString) -> (Void) in
            guard let blockSelf = self else { return }
            if errorString != nil {
                blockSelf.presenter.unsucessful(errorString: errorString!)
            } else if responce != nil && errorString == nil {
                blockSelf.decodeJSON(from: responce)
                blockSelf.presenter.successful()
            }
        }
    }
    
    private func decodeJSON(from data: Data!) {
        
        guard let JSON = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [[String: Any]] else { return }
        for mark in JSON {
            guard let text = mark["text"] as? String else { return }
            guard let name = mark["name"] as? String else { return }
            guard let imageURL = mark["image_URL"] as? String else { return }
            
            let trashModel = Trash(name: name, text: text, imageURL: imageURL)
            trash.append(trashModel)
        }
      
    }
    
    func getTrashCount() -> Int {
        return trash.count
    }
    
    func getTrash(at index: Int) -> Trash {
        return trash[index]
    }
    
}
