//
//  NetworkMethod.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 18.08.2022.
//

import Foundation

enum NetworkMethod: String {
    
    case get
    case post
}

extension NetworkMethod {
    var method: String {
        rawValue.uppercased()
    }
}
