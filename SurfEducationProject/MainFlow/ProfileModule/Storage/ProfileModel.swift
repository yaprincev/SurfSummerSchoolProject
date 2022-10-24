//
//  ProfileModel.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 21.08.2022.
//

import Foundation


struct ProfileModel: Decodable {
    let firstName: String
    let lastName: String
    let avatar: String
    let phone: String
    let city: String
    let email: String

    let about: String
}

struct ProfileInstance {
    static let shared = ProfileInstance()
    let profileModel: ProfileModel

    init() {
        let storage = DefaultProfileStorage()
        do {
            let profile = try storage.getProfileInfo()
            self.profileModel = profile
        } catch {
            print(error)
            self.profileModel = ProfileModel(firstName: "Александра", lastName: "Новикова", avatar: "", phone: "Новикова", city: "Санкт-Петербург", email: "alexandra@surfstudio.ru", about: "Error")
        }
    }
}
