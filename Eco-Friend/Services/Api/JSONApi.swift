//
//  JSONApi.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 29.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum JSONApi {
    case getMarks
    case getTrash
}

///https://api.npoint.io/2c2913b224b572c1b83a
///https://api.npoint.io/049c845c46a55f81c9d7

extension JSONApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.npoint.io")!
    }
    
    var path: String {
        switch self {
        case .getMarks:
            return "2c2913b224b572c1b83a"
        case.getTrash:
            return "049c845c46a55f81c9d7"
        }
        
    }
    
    var method: Alamofire.HTTPMethod  {
        return HTTPMethod.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
