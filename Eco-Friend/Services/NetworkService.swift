//
//  NetworkService.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import Moya
import WebKit

class NetworkService {
    
    let vkProvider: MoyaProvider<VKApi>!
    private var authURL: URL = URL(string: "https://oauth.vk.com/authorize?client_id=7245546&scope=video&redirect_uri=http://api.vkontakte.ru/blank.html&display=touch&response_type=token")!
    
    init() {

        vkProvider = MoyaProvider<VKApi>()
    }
    
    public func getPosts(completionHandler: @escaping (Data?, String? ) -> (Void)) {
        
        let vkRequestModel = VKRequestModel(token: "3a940e313a940e313a940e31203afa80db33a943a940e3167673c811df6ef549d2085ee", groupId: "-96281069",count: 200, apiVersion: "5.103")
    
        vkProvider.request(.getPosts(model: vkRequestModel)) { (result) in
            switch result {
            case .success(let responce):
                completionHandler(responce.data, nil)
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            }
        }
    }
    
    public func getAuthURL() -> URL {
        return authURL
    }
    
    static func clearCookie() {
        
        let dataStore = WKWebsiteDataStore.default()
        dataStore.httpCookieStore.getAllCookies({ (cookies) in
            for cookie in cookies {
                dataStore.httpCookieStore.delete(cookie, completionHandler: nil)
            }
        })
    }
}
