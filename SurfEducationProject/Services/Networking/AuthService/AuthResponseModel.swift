//
//  AuthResponseModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 18.08.2022.
//

import Foundation

struct AuthResponseModel: Decodable {
    
    let token: String
    let user_info: ProfileModel
}
