//
//  UserDefaultsLocalDataStorage.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

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
