//
//  ProfileStorage.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 21.08.2022.
//

import Foundation

protocol ProfileStorage {

    func getProfileInfo() throws -> ProfileModel
    func set(profile: ProfileModel) throws
    func removeProfile() throws

}
