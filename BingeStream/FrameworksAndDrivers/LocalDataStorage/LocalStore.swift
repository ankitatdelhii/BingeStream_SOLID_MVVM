//
//  Store.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation
/*
// MARK: - Protocols

protocol LocalDataStorage {
    func save<T: Encodable>(object: T, forKey key: String) throws
    func load<T: Decodable>(forKey key: String) throws -> T?
    func delete(forKey key: String)
}

// MARK: - UserDefaultsLocalDataStorage Implementation

class UserDefaultsLocalDataStorage: LocalDataStorage {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func save<T: Encodable>(object: T, forKey key: String) throws {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            userDefaults.set(data, forKey: key)
        } catch {
            throw error
        }
    }

    func load<T: Decodable>(forKey key: String) throws -> T? {
        guard let data = userDefaults.data(forKey: key) else {
            return nil
        }

        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch {
            throw error
        }
    }

    func delete(forKey key: String) {
        userDefaults.removeObject(forKey: key)
    }
}

// Usage
let storage = UserDefaultsLocalDataStorage()

struct User: Codable {
    let id: Int
    let name: String
}

let user = User(id: 1, name: "John Doe")

do {
    try storage.save(object: user, forKey: "user")
    let loadedUser: User? = try storage.load(forKey: "user")
    print("Loaded user: \(loadedUser)")
    storage.delete(forKey: "user")
} catch {
    print("Error: \(error.localizedDescription)")
}
*/
