//
//  LocalDataCoordinator.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol LocalDataCoordinator {
    func save<T: Codable>(data: T, forKey key: String, completion: ((Result<Bool, Error>) -> Void)?)
    func fetch<T: Codable>(forKey key: String, completion: (Result<T, Error>) -> Void)
    func delete(forKey key: String, completion: (Result<Bool, Error>) -> Void)
}

//MARK: Model //rm Move it to Model
enum LocalStorageErrorModel: Error {
    case unableToConvert
}
