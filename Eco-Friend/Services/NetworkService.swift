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
    let jsonProvider: MoyaProvider<JSONApi>!
    
    init() {

        vkProvider = MoyaProvider<VKApi>()
        jsonProvider = MoyaProvider<JSONApi>()
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
    
    public func getMarks(completionHandler: @escaping (Data?, String? ) -> (Void)) {
        jsonProvider.request(.getMarks) { (result) in
            switch result {
            case .success(let responce):
                completionHandler(responce.data, nil)
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            }
        }
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
