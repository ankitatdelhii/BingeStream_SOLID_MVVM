//
//  LocalDataCoordinatorImpl.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

class LocalDataCoordinatorImpl: LocalDataCoordinator {
    private let localDataStorage: LocalDataStorage

    init(localDataStorage: LocalDataStorage) {
        self.localDataStorage = localDataStorage
    }
    
    func save<T>(data: T, forKey key: String, completion: (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        do {
            if let wrappedCachedData: T? = try localDataStorage.load(forKey: key),
               let cachedData = wrappedCachedData {
                completion(.success(cachedData))
            } else {
                completion(.failure(LocalStorageErrorModel.unableToConvert))
            }
        } catch {
            completion(.failure(error))
        }
    }
    
    
    func fetch<T: Codable>(forKey key: String, completion: (Result<T, Error>) -> Void) {
        do {
            if let wrappedCachedData: T? = try localDataStorage.load(forKey: key),
               let cachedData = wrappedCachedData {
                completion(.success(cachedData))
            } else {
                completion(.failure(LocalStorageErrorModel.unableToConvert))
            }
        } catch {
            completion(.failure(error))
        }
        
    }
    
    func delete(forKey key: String, completion: (Result<Bool, Error>) -> Void) {
        localDataStorage.delete(forKey: key)
        completion(.success(true))
    }
}
