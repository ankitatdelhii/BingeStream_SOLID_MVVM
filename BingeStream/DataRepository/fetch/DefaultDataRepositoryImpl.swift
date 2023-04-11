//
//  DefaultDataRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//
import Foundation

class DefaultDataRepositoryImpl: DefaultDataRepository {
    private let networkClient: APiNetworkClient
    private let dataStorage: LocalDataStorage

    init(networkClient: APiNetworkClient, dataStorage: LocalDataStorage) {
        self.networkClient = networkClient
        self.dataStorage = dataStorage
    }

    func fetchData<T: Codable>(endpoint: APIEndpoint, storageKey: String, completion: @escaping (Result<T, Error>) -> Void) {
        if let localData: T = try? dataStorage.load(forKey: storageKey) {
            completion(.success(localData))
        } else {
            networkClient.request(endpoint: endpoint) { (result: Result<Data, Error>) in
                switch result {
                case .success(let data):
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        try self.dataStorage.save(object: decodedObject, forKey: storageKey)
                        completion(.success(decodedObject))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
