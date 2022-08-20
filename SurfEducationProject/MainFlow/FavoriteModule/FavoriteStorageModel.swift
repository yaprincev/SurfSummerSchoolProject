//
//  FavoriteStorageModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 19.08.2022.
//

import Foundation
import RealmSwift

class FavoriteModel: Object {
    @objc dynamic var imageUrlInString = ""
    @objc dynamic var title = "Title"
    @objc dynamic var isFavorite = true
    @objc dynamic var content = ""
    @objc dynamic var dateCreation = ""

}
