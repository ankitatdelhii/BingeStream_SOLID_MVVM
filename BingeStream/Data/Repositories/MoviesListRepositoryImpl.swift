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
        self.endPoint = APIEndpoints().getMoviesList(page: 1, limit: 5)
    }
    
}

extension MoviesListRepositoryImpl: MoviesListRepository {
    
    func fetchMovieList(cached: (Result<[MoviesListDTO], Error>) -> Void, api: @escaping (Result<[MoviesListDTO], Error>) -> Void) {
        
        localDataCordinator.fetch(forKey: KEY_MOVIES_REPOSITORY, completion: cached)
        networkClient.request(endpoint: endPoint) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                //Todo : Separate JSON Decoder
                do {
                    let apiData = try JSONDecoder().decode([MoviesListDTO].self, from: data)
                    self.localDataCordinator.save(data: apiData, forKey: self.KEY_MOVIES_REPOSITORY, completion: nil)
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

