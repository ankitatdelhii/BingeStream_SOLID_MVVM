//
//  RemoteOnlyDataFetchRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

protocol RemoteOnlyDataFetchRepository {
    func fetchData<T: Codable>(endpoint: APIEndpoint, completion: @escaping (Result<T, Error>) -> Void)
}
