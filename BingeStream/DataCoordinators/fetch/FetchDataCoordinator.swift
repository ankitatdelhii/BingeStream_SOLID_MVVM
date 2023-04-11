//
//  DataCoordinator.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

class FetchDataCoordinator {
    private let defaultDataRepository: DefaultDataRepository
    private let remoteOnlyFetchRepo: RemoteOnlyDataFetchRepository

    init(dataFetchingRepository: DefaultDataRepository,
         remoteOnlyFetchRepo: RemoteOnlyDataFetchRepository) {
        self.defaultDataRepository = dataFetchingRepository
        self.remoteOnlyFetchRepo = remoteOnlyFetchRepo
    }

    func getData<T: Codable>(strategy: DataFetchingStrategy, endpoint: APIEndpoint, storageKey: String, completion: @escaping (Result<T, Error>) -> Void) {
        switch strategy {
        case .defaultFetch:
            defaultDataRepository.fetchData(endpoint: endpoint, storageKey: storageKey, completion: completion)
        case .remoteOnlyFetch:
            remoteOnlyFetchRepo.fetchData(endpoint: endpoint, completion: completion)
        }
    }
}
