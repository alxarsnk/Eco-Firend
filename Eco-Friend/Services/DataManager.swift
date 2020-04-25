//
//  DataManager.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 16.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import Foundation
import RealmSwift

protocol DataManagerProtocol {
    
    func getPostsCount() -> Int
    
    func getFavouritePostsCount() -> Int
    
    func getPost(at index: Int) -> NewsTableViewCellModel
    
    func getFavouritePost(at index: Int) -> NewsTableViewCellModel
    
    func addPostToFavourites(at index: Int)
    
    func removePostFromFavourites(at index: Int)
    
    func setPosts(posts: [NewsTableViewCellModel])
}

class DataManager: DataManagerProtocol  {
    
    static let shared: DataManagerProtocol = DataManager()
    
    private let dataBase = DatabaseService()
    
    var posts: [NewsTableViewCellModel] = []
    
    var favouritePosts: [NewsTableViewCellModel] = []
    
    func getPostsCount() -> Int {
        
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        return dbModels.count
    }
    
    func getFavouritePostsCount() -> Int {
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        let favouriteDBModels = dbModels.filter{ $0.isFavourite == true }
        return favouriteDBModels.count
    }
    
    func getPost(at index: Int) -> NewsTableViewCellModel {
        
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        let dbModel = dbModels[index]
        return convertDBModelToViewModel(DBModel: dbModel)
    }
    
    func getFavouritePost(at index: Int) -> NewsTableViewCellModel {
        
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        let favouriteDBModels = dbModels.filter{ $0.isFavourite == true }
        let favouriteDBModel = favouriteDBModels[index]
        return convertDBModelToViewModel(DBModel: favouriteDBModel)
    }
    
    func addPostToFavourites(at index: Int) {
       
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        let dbModel = dbModels[index]
        dataBase.editModel {
            dbModel.isFavourite = true
        }
    }
    
    func removePostFromFavourites(at index: Int) {
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        let favouriteDBModels = dbModels.filter{ $0.isFavourite == true }
        let favouriteDBModel = favouriteDBModels[index]
        dataBase.editModel {
            favouriteDBModel.isFavourite = false
        }
    }
    
    func setPosts(posts: [NewsTableViewCellModel]) {
        
        if isNeedToUpdateDB(posts: posts) {
            
            let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
            let favouriteDBModels = dbModels.filter{ $0.isFavourite == true }
            
            for favouriteDBModel in favouriteDBModels {
                let favouriteViewModel = convertDBModelToViewModel(DBModel: favouriteDBModel)
                for var post in posts {
                    if favouriteViewModel.text == post.text {
                        post = favouriteViewModel
                    }
                }
            }
            
            dataBase.clearAll()
            for post in posts {
                let dbModel = convertViewModelToDBModel(viewModel: post)
                dataBase.saveModel(model: dbModel)
            }
        }
    }
    
    private func isNeedToUpdateDB(posts: [NewsTableViewCellModel]) -> Bool {
       
        let dbModels: [PostDatabaseModel] = dataBase.obtainModels()
        
        let convertedModels = posts.map{ convertViewModelToDBModel(viewModel: $0) }
        
        return !isEqual(firstArray: dbModels, secondArray: convertedModels)
    }
    
    private func isEqual(firstArray: [PostDatabaseModel], secondArray: [PostDatabaseModel]) -> Bool {
        
        var isEqual = true
        
        if firstArray.count != secondArray.count {
            isEqual = false
        } else {
            for index in Range(0...firstArray.count-1) {
                if firstArray[index].text != secondArray[index].text {
                    isEqual = false
                }
            }
        }
        return isEqual
    }
    
    
    private func convertViewModelToDBModel(viewModel: NewsTableViewCellModel) -> PostDatabaseModel {
        
        let DBModel = PostDatabaseModel()
        DBModel.text = viewModel.text ?? ""
        let list = List<String>()
        for imageURL in viewModel.imagesURL ?? [] {
            list.append(imageURL.description)
        }
        DBModel.imageURLs = list
        DBModel.isFavourite = viewModel.isFavourite ?? false
        return DBModel
    }
    
    private func convertDBModelToViewModel(DBModel: PostDatabaseModel) -> NewsTableViewCellModel {
        
        let text = DBModel.text
        let imagesURL = DBModel.imageURLs.map { URL(string: $0)! }
        let isFavourite = DBModel.isFavourite
        
        let viewModel = NewsTableViewCellModel(text: text, imagesURL: Array(imagesURL), isFavourite: isFavourite)
        
        return viewModel
    }
}
