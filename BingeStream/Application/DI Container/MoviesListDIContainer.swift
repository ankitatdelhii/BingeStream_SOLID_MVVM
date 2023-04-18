//
//  MoviesListDIContainer.swift
//  BingeStream
//
//  Created by Ankit Saxena on 19/04/23.
//

import Foundation

protocol MovieListDIContainer {
    func makeMovieListViewController() -> MoviesListViewController
}

final class MovieListDIContainerImpl: MovieListDIContainer {
    
    struct Dependencies {
        let localDataCoordinator: LocalDataCoordinator
        let networkClient: APiNetworkClient
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    
    // MARK: - Repositories
    private func makeNasaImagesListReporistory() -> NasaImagesListRepository {
        return NasaImagesListRepositoryImpl(localDataCordinator: dependencies.localDataCoordinator, networkClient: dependencies.networkClient)
    }
    
    
    // MARK: -  Use Cases
    private func makeNasaImagesListUseCase() -> NasaImagesListUseCase {
        return NasaImagesListUseCaseImpl(nasaImagesListRepository: makeNasaImagesListReporistory())
    }
    
    // MARK: -  MoviesList ViewModel
    private func makeMoviesListViewModel() -> MoviesListViewModel {
        return MoviesListViewModel(nasaImagesListUseCase: makeNasaImagesListUseCase())
    }
    
    // MARK: - Movies List
    func makeMovieListViewController() -> MoviesListViewController {
        let controller = MoviesListViewController.instance(viewModel: makeMoviesListViewModel())
        
        return controller
    }
    
}
