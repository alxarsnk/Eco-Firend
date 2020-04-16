//
//  NetworkService.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import Moya

class NetworkService {
    
    let vkProvider: MoyaProvider<VKApi>!
    private var authURL: URL = URL(string: "https://oauth.vk.com/authorize?client_id=7245546&scope=video&redirect_uri=http://api.vkontakte.ru/blank.html&display=touch&response_type=token")!
    
    init() {

        vkProvider = MoyaProvider<VKApi>()
    }
    
    public func getPosts(with token: String, completionHandler: @escaping (Data?, String? ) -> (Void)) {
        
        let vkRequestModel = VKRequestModel(token: token, groupId: "-96281069",count: 200, apiVersion: "5.103")
    
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
}
