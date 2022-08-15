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
    
    var items: [DetailItemModel] = [] {
        didSet {
            didItemUpdated?()
        }
    }
    
    // MARK: - Methods
    
    func getPosts() {
        items = Array(repeating: DetailItemModel.createDefault(), count: 100)
    }
}


