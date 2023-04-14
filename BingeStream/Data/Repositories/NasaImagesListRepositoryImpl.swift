//
//  NasaImagesListRepositoryImpl.swift
//  BingeStream
//
//  Created by Ankit Saxena on 15/04/23.
//

import Foundation

class NasaImagesListRepositoryImpl {
    
    private let localDataCordinator: LocalDataCoordinator
    private let networkClient: APiNetworkClient
    private let KEY_NASA_IMAGES_REPOSITORY = "KEY_NASA_IMAGES_REPOSITORY"
    private let endPoint: APIEndpoint
    
    init(localDataCordinator: LocalDataCoordinator, networkClient: APiNetworkClient) {
        self.localDataCordinator = localDataCordinator
        self.networkClient = networkClient
        self.endPoint = APIEndpoints().getNasaImages()
    }
    
}

extension NasaImagesListRepositoryImpl: NasaImagesListRepository {
    
    func fetchImages(cachedImages: (Result<NasaRoverResponseDTO, Error>) -> Void, apiImages: @escaping (Result<NasaRoverResponseDTO, Error>) -> Void) {
        localDataCordinator.fetch(forKey: KEY_NASA_IMAGES_REPOSITORY, completion: cachedImages)
        networkClient.request(endpoint: endPoint) { result in
            switch result {
            case .success(let success):
                do {
                    let apiData = try JSONDecoder().decode(NasaRoverResponseDTO.self, from: success)
                    apiImages(.success(apiData))
                } catch {
                    apiImages(.failure(error))
                }
                
            case .failure(let failure):
                apiImages(.failure(failure))
            }
        }
    }
    
    
//    func fetchMovieList(cached: (Result<[MoviesListModel], Error>) -> Void, api: @escaping (Result<[MoviesListModel], Error>) -> Void) {
//
//        localDataCordinator.fetch(forKey: KEY_MOVIES_REPOSITORY, completion: cached)
//        networkClient.request(endpoint: endPoint) { result in
//            switch result {
//            case .success(let data):
//                //Todo : Separate JSON Decoder
//                do {
//                    let apiData = try JSONDecoder().decode([MoviesListModel].self, from: data)
//                    api(.success(apiData))
//                } catch {
//                    api(.failure(error))
//                }
//
//            case .failure(let failure):
//                api(.failure(failure))
//            }
//        }
//    }
    
    
}
