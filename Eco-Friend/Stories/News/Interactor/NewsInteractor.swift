//
//  NewsInteractor.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 20.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsInteractor: NewsInteractorInput {
    
    var presenter: NewsInteractorOutput!
    var models: [NewsTableViewCellModel] = []
    
    //MARK: - NewsInteractorInput
    
    func requsetData(with token: String) {
        Global.Services.networkService.getPosts(with: token) { (responce, errorString) -> (Void) in
            if errorString != nil {
                print("Error")
            } else if responce != nil && errorString == nil {
                self.decodeJSON(from: responce!)
                self.presenter.updateView()
            }
        }
    }
    
    private func decodeJSON(from data: Data) {
        
        guard let JSON = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return }
        guard let responce = JSON["response"] as? [String: Any]  else { return }
        guard let items = responce["items"] as? [[String: Any]] else { return }
        for item in items {
            if (item["post_type"] as? String) == "post" {
                let text = item["text"] as? String
                guard let attachments = item["attachments"] as? [[String: Any]] else { return }
                var imagesURL: [URL] = []
                for attachment in attachments {
                    if (attachment["type"] as? String) == "photo" {
                        guard let photo = attachment["photo"] as? [String: Any] else { return }
                        guard let sizes = photo["sizes"] as? [[String: Any]] else { return }
                        guard let urlString = sizes.last!["url"] as? String else { return }
                        if let url = URL(string: urlString) {
                            imagesURL.append(url)
                        }
                    }
                }
                let model = NewsTableViewCellModel(text: text, imagesURL: imagesURL)
                models.append(model)
            }
        }
    }
    
    func getPostsCount() -> Int {
        return models.count
    }
    
    func getCellModel(at index: Int) -> NewsTableViewCellModel {
        return models[index]
    }
    
    func getAuthURL() -> URL {
        return Global.Services.networkService.getAuthURL()
    }
}
