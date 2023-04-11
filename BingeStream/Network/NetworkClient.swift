//
//  NetworkClient.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

class NetworkClient {
    private let dispatcher: NetworkDispatcher

    init(dispatcher: NetworkDispatcher) {
        self.dispatcher = dispatcher
    }

    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        dispatcher.execute(request: endpoint) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
            }
        }
    }
}
