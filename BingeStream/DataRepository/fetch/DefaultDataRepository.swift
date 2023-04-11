//
//  DataRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

// MARK: - Protocol

protocol DefaultDataRepository {
    func fetchData<T: Codable>(endpoint: APIEndpoint, storageKey: String, completion: @escaping (Result<T, Error>) -> Void)
}

