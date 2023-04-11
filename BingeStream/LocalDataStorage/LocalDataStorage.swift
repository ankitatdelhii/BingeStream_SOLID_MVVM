//
//  LocalDataStorage.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

// MARK: - Protocols

protocol LocalDataStorage {
    func save<T: Encodable>(object: T, forKey key: String) throws
    func load<T: Decodable>(forKey key: String) throws -> T?
    func delete(forKey key: String)
}
