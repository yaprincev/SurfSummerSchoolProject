//
//  DetailItemModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 16.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dataCreation: String
    let content: String
    
    static func createDefault() -> DetailItemModel {
        .init(image: UIImage(named: "default-image"), title: "Самый милый корги" , isFavorite: false, dataCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам.")
    }
}
