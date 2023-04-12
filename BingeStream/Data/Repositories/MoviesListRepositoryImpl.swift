//
//  MoviesListRepositoryImpl.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

final class MoviesListRepositoryImpl {
    
    private let localDataCordinator: LocalDataCoordinator
    private let networkClient: APiNetworkClient
    private let KEY_MOVIES_REPOSITORY = "KEY_MOVIES_REPOSITORY"
    private let endPoint: APIEndpoint
    
    init(localDataCordinator: LocalDataCoordinator, networkClient: APiNetworkClient) {
        self.localDataCordinator = localDataCordinator
        self.networkClient = networkClient
        self.endPoint = APIEndpoints().getMoviesList()
    }
    
}

extension MoviesListRepositoryImpl: MoviesListRepository {
    
    func fetchMovieList(cached: (Result<[MoviesListModel], Error>) -> Void, api: @escaping (Result<[MoviesListModel], Error>) -> Void) {
        
        localDataCordinator.fetch(forKey: KEY_MOVIES_REPOSITORY, completion: cached)
        networkClient.request(endpoint: endPoint) { result in
            switch result {
            case .success(let data):
                //Todo : Separate JSON Decoder
                do {
                    let apiData = try JSONDecoder().decode([MoviesListModel].self, from: data)
                    api(.success(apiData))
                } catch {
                    api(.failure(error))
                }
                
            case .failure(let failure):
                api(.failure(failure))
            }
        }
    }
    
    
}

