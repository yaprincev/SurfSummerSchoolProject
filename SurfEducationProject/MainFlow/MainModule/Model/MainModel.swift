//
//  MainModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 05.08.2022.
//

import Foundation
import UIKit

final class MainModel {
    
    // MARK: - Events
    
    var didItemUpdated: (() -> Void)?
    
    // MARK: - Properties
    
    let pictureService = PicturesService()
    var items: [DetailItemModel] = [] {
        didSet {
            didItemUpdated?()
        }
    }
    
    // MARK: - Methods
    
    func loadPosts() {
        pictureService.loadPictures { [weak self] result in
                     switch result {
                     case .success(let pictures):
                         self?.items = pictures.map { pictureModel in
                             DetailItemModel(
                                 imageUrlInString: pictureModel.photoUrl,
                                 title: pictureModel.title,
                                 isFavorite: false, // TODO: - Need adding `FavoriteService`
                                 content: pictureModel.content,
                                 dateCreation: pictureModel.date
                             )
                         }
                     case .failure(let error):
                         // TODO: - Implement error state there
                         break
                     }
                 }
    }
}

