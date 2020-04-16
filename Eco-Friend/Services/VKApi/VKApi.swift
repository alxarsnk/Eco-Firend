//
//  VKApi.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 21.02.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import Moya
import Alamofire

struct VKRequestModel {
    let token: String
    let groupId: String
    let count: Int
    let apiVersion: String
}

enum VKApi {
    case getPosts(model: VKRequestModel)
}

extension VKApi: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.vk.com")!
    }
    
    var path: String {
        return "method/wall.get"
    }
    
    var method: Alamofire.HTTPMethod  {
        return HTTPMethod.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .getPosts(let model):
            return .requestParameters(parameters: ["access_token":model.token, "owner_id":model.groupId, "count":model.count, "v":model.apiVersion], encoding: URLEncoding.queryString)
        }
    }
        
    var headers: [String : String]? {
        return nil
    }
}
