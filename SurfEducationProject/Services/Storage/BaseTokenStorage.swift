//
//  BaseTokenStorage.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 18.08.2022.
//

import Foundation

 struct BaseTokenStorage: TokenStorage {

     func getToken() throws -> TokenContainer {
         TokenContainer(
             token: "3650235e08047464fc555ff67c22d7d108b6cbcd49c50779811296bcf70c8fe2"
         )
     }

     func set(newToken: TokenContainer) throws { }

 }
