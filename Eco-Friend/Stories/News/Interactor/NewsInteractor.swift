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
    var dataManager: DataManagerProtocol!
    
    //MARK: - NewsInteractorInput
    
    func requsetData() {
        Global.Services.networkService.getPosts() { (responce, errorString) -> (Void) in
            if errorString != nil {
                self.presenter.failureUpdateView()
            } else if responce != nil && errorString == nil {
                self.decodeJSON(from: responce!)
                self.dataManager.setPosts(posts: self.models)
                self.presenter.successUpdateView()
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
                let modelText = self.textWithLinkReplacement(text: text ?? "")
                let model = NewsTableViewCellModel(text: modelText, imagesURL: imagesURL)
                models.append(model)
            }
        }
    }
    
    func getPostsCount() -> Int {
        return dataManager.getPostsCount()
    }
    
    func getCellModel(at index: Int) -> NewsTableViewCellModel {
        return dataManager.getPost(at: index)
    }
    
    func getAuthURL() -> URL {
        return Global.Services.networkService.getAuthURL()
    }
    
    func addToFavourites(at indexPath: IndexPath) {
        dataManager.addPostToFavourites(at: indexPath.row)
    }
    
    func removeFromFavourites(at indexPath: IndexPath) {
        dataManager.removePostFromFavourites(at: indexPath.row)
    }
    
    func clearCookie() {
        NetworkService.clearCookie()
    }
    
    private func textWithLinkReplacement(text: String) -> String {
        
        let regexPattern = "\\[(id|club)\\d+\\|(.+?)\\]"
        let prefix = "https://vk.com/"
        var newText = text
        let regex = try! NSRegularExpression(pattern: regexPattern, options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, text.utf16.count)
        regex.matches(in: text, options: [], range: range).map {
            
            let replcementRange = Range($0.range, in: text)!
            let match = text[replcementRange]
            let link = prefix + match.split(separator: "|")[0].dropFirst()
            newText = newText.replacingOccurrences(of: match, with: link)
        }
        return newText
    }
}
