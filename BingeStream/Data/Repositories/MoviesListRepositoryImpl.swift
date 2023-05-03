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
    private var endPoint: APIEndpoint
    private let limit = 5
    
    init(localDataCordinator: LocalDataCoordinator, networkClient: APiNetworkClient) {
        self.localDataCordinator = localDataCordinator
        self.networkClient = networkClient
        self.endPoint = APIEndpoints().getMoviesList(page: 1, limit: limit)
    }
    
    private func fetchLocalData(page: Int, cached: (Result<[MoviesListDTO], Error>) -> Void) {
        //Local Data - Storing and fetching only first page of paginated data
        if page == 1 {
            localDataCordinator.fetch(forKey: KEY_MOVIES_REPOSITORY, completion: cached)
        } else {
            cached(.failure(LocalStorageErrorModel.dataNotInCache))
        }
    }
    
    private func storeLocalData(page: Int, data: [MoviesListDTO]) {
        //Local Data - Storing only first page of paginated data
        if page == 1 {
            self.localDataCordinator.save(data: data, forKey: self.KEY_MOVIES_REPOSITORY, completion: nil)
        }
    }
    
}

extension MoviesListRepositoryImpl: MoviesListRepository {
    
    func fetchMovieList(page: Int, cached: (Result<[MoviesListDTO], Error>) -> Void, api: @escaping (Result<[MoviesListDTO], Error>) -> Void) {
        //Local Data
        fetchLocalData(page: page, cached: cached)
        
        //DTO
        self.endPoint = APIEndpoints().getMoviesList(page: page, limit: limit)
        networkClient.request(endpoint: endPoint) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                //Todo : Separate JSON Decoder
                do {
                    let apiData = try JSONDecoder().decode([MoviesListDTO].self, from: data)
                    self.storeLocalData(page: page, data: apiData)
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

