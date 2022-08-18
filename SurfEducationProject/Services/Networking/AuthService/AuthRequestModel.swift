//
//  AuthRequestModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 18.08.2022.
//

import Foundation

struct AuthRequestModel: Encodable {
    
    let phone: String
    let password: String
}
