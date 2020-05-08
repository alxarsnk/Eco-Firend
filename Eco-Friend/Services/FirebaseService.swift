//
//  FirebaseService.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 07.05.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    
    let db = Firestore.firestore()
    let marksListId = [-15,-14,-12,-13,-11]
    var marksListData: [[String: Any]]? = []
    
    func getMarksList(completionHandler: @escaping ([[String: Any]]?, Error? ) -> (Void)) {
        
        db.collection("preparings").getDocuments { [ weak self ] (snapshot, error) in
            guard let blockSelf = self else { return }
            if let err = error {
                print("Error getting documents: \(err)")
                completionHandler(nil, err)
            } else {
                for document in snapshot!.documents {
                    blockSelf.marksListId.map {
                        if document.data()["id"] as? Int == $0 {
                            blockSelf.marksListData?.append(document.data())
                        }
                    }
                }
                completionHandler(blockSelf.marksListData, nil)
            }
        }
    }
}
 
