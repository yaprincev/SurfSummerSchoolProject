//
//  DefaultProfileStorage.swift
//  SurfEducationProject
//
//  Created by Максим Япринцев on 21.08.2022.
//

import Foundation

struct DefaultProfileStorage: ProfileStorage {

    // MARK: - Properties
    
    private var unprotectedStorage: UserDefaults {
        UserDefaults.standard
    }

    // MARK: - StorageKeys
    
    private let firstNameKey: String = "name"
    private let lastNameKey: String = "surname"
    private let avatarKey: String = "avatar"
    private let phoneKey: String = "phone number"
    private let cityKey: String = "city"
    private let emailKey: String = "email"
    private let aboutKey: String = "info"


    // MARK: - TokenStorage
    
    func getProfileInfo() throws -> ProfileModel {
        let profile = try getProfileFromStorage()
        return profile
    }

    func set(profile: ProfileModel) throws {
        removeProfileFromStorage()
        saveProfileInStorage(profile: profile)
    }

    func removeProfile() throws {
        removeProfileFromStorage()
    }

}

private extension DefaultProfileStorage {

    enum Error: Swift.Error {
        case profileWasNotFound
    }
    func getProfileFromStorage() throws -> ProfileModel {
        guard
              let profileFirstName = unprotectedStorage.value(forKey: firstNameKey) as? String,
              let profileLastName = unprotectedStorage.value(forKey: lastNameKey) as? String,
              let profileAvatar = unprotectedStorage.value(forKey: avatarKey) as? String,
              let profilePhone = unprotectedStorage.value(forKey: phoneKey) as? String,
              let profileCity = unprotectedStorage.value(forKey: cityKey) as? String,
              let profileEmail = unprotectedStorage.value(forKey: emailKey) as? String,
              let profileAbout = unprotectedStorage.value(forKey: aboutKey) as? String
                
        else { throw Error.profileWasNotFound }
        let profile = ProfileModel(firstName: profileFirstName, lastName: profileLastName, avatar: profileAvatar, phone: profilePhone, city: profileCity, email: profileEmail, about: profileAbout)
        return profile
    }

    func saveProfileInStorage(profile: ProfileModel) {
        unprotectedStorage.set(profile.firstName, forKey: firstNameKey)
        unprotectedStorage.set(profile.lastName, forKey: lastNameKey)
        unprotectedStorage.set(profile.avatar, forKey: avatarKey)
        unprotectedStorage.set(profile.phone, forKey: phoneKey)
        unprotectedStorage.set(profile.city, forKey: cityKey)
        unprotectedStorage.set(profile.email, forKey: emailKey)
        unprotectedStorage.set(profile.about, forKey: aboutKey)
    }

    func removeProfileFromStorage() {
        unprotectedStorage.set(nil, forKey: firstNameKey)
        unprotectedStorage.set(nil, forKey: lastNameKey)
        unprotectedStorage.set(nil, forKey: avatarKey)
        unprotectedStorage.set(nil, forKey: phoneKey)
        unprotectedStorage.set(nil, forKey: cityKey)
        unprotectedStorage.set(nil, forKey: emailKey)
        unprotectedStorage.set(nil, forKey: aboutKey)
    }
}
