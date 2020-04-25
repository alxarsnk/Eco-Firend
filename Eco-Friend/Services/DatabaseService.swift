//
//  DatabaseService.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 17.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class PostDatabaseModel: Object {
    
    dynamic var text = String()
    dynamic var imageURLs =  List<String>()
    dynamic var isFavourite = Bool()
}

class DatabaseService {
    
    fileprivate lazy var mainRealm: Realm = {
        
        let config = Realm.Configuration(
            
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    
                }
        })
        Realm.Configuration.defaultConfiguration = config
        return try! Realm(configuration: .defaultConfiguration)
    }()
    
    
    func obtainModels<T: Object>() -> [T] {
       
        
        let models = mainRealm.objects(T.self)
        return Array(models)
    }
    
    
    func saveModel(model: Object) {
        
        try! mainRealm.write {
            mainRealm.add(model)
        }
    }
    
    func editModel(completion: @escaping () -> Void) {
        try! mainRealm.write {
            completion()
        }
    }
    
    func clearAll() {
        
        try! mainRealm.write {
            mainRealm.deleteAll()
        }
    }
    
}
