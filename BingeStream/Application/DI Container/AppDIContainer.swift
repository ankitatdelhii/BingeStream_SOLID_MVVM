//
//  AppDIContainer.swift
//  BingeStream
//
//  Created by Ankit Saxena on 19/04/23.
//

import Foundation



final class AppDIContainer {
    
    
    private var localDataCoordinator: LocalDataCoordinator {
       let cordinator = LocalDataCoordinatorImpl(localDataStorage: UserDefaultsLocalDataStorage())
        return cordinator
    }
    
    private var apiNetworkClient: APiNetworkClient {
        let client = NetworkClient(dispatcher: URLSessionNetworkDispatcher())
        return client
    }
    
    
    func makeMoviesListViewController() -> MoviesListViewController {
        let moviesListContainer = MovieListDIContainerImpl(dependencies: MovieListDIContainerImpl.Dependencies(localDataCoordinator: localDataCoordinator, networkClient: apiNetworkClient))
        return moviesListContainer.makeMovieListViewController()
    }
    
    
}
