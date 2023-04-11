//
//  RemoteOnlyDataFetchRepositoryImpl.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

class RemoteOnlyDataFetchRepositoryImpl: RemoteOnlyDataFetchRepository {
    
    private let networkClient: APiNetworkClient

    init(networkClient: APiNetworkClient) {
        self.networkClient = networkClient
    }

    func fetchData<T>(endpoint: APIEndpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        networkClient.request(endpoint: endpoint) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                do {
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
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
