//
//  TabBarModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 04.08.2022.
//

import Foundation
import UIKit

enum TabBarModel {
    case main
    case favorite
    case profile
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .favorite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "Main")
        case .favorite:
            return UIImage(named: "Favorite")
        case .profile:
            return UIImage(named: "Profile")
        }
    }
    
    var selectedImage: UIImage? {
        return image
    }
}

