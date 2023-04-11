//
//  NetworkClient.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

protocol APiNetworkClient: AnyObject {
    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkClient: APiNetworkClient {
    private let dispatcher: NetworkDispatcher

    init(dispatcher: NetworkDispatcher) {
        self.dispatcher = dispatcher
    }

    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        dispatcher.execute(request: endpoint) { (data, response, error) in
            if let error = error {
                completion(.failure(NetworkError.requestFailed(error)))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NetworkError.noData))
            }
        }
    }
}
