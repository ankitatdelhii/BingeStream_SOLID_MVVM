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
    private func makeMoviesListRepository() -> MoviesListRepository {
        return MoviesListRepositoryImpl(localDataCordinator: dependencies.localDataCoordinator, networkClient: dependencies.networkClient)
    }
    
    
    // MARK: -  Use Cases
    private func makeMoviesListUseCase() -> MoviesListUseCase {
        return MoviesListUseCaseImpl(moviesListRepository: makeMoviesListRepository())
    }
    
    // MARK: -  MoviesList ViewModel
    private func makeMoviesListViewModel(movieListOutput: MoviesListViewModelOutput) -> MoviesListViewModelOutcomes {
        return MoviesListViewModel(moviesListUseCase: makeMoviesListUseCase(), outputDelegate: movieListOutput)
    }
    
    //MARK: MovieListController
    private func makeMovieListController() -> MoviesListViewController {
        let controller = MoviesListViewController.init(nibName: MoviesListViewController.controllerName, bundle: nil)
        
        return controller
    }
    
    // MARK: - Movies List
    func makeMovieListViewController() -> MoviesListViewController {
        let controlller = makeMovieListController()
        let viewController = MoviesListViewController.instance(controller: controlller, viewModel: makeMoviesListViewModel(movieListOutput: controlller))
        
        return viewController
    }
    
}
