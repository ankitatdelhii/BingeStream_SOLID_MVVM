//
//  MoviesListViewModel.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import Foundation

protocol MoviesListViewModelInput {
    func getMovies()
}

protocol MoviesListViewModelOutput {
    var moviesListModel: [FilmsListModel] { get set }
}

typealias MoviesListViewModelOutcomes = MoviesListViewModelInput & MoviesListViewModelOutput

final class MoviesListViewModel: MoviesListViewModelOutcomes {
    
    //MARK: Private Properties
    private let moviesListUseCase: MoviesListUseCase
    private var filmsModel = [FilmsListModel]() {
        didSet {
            moviesListModel = filmsModel
        }
    }
    
    //MARK: Public Properties
    var moviesListModel: [FilmsListModel] {
        get {
            return filmsModel
        }
        set {
            filmsModel = newValue
        }
    }
    
    //MARK: Lifecycle
    init(moviesListUseCase: MoviesListUseCase) {
        self.moviesListUseCase = moviesListUseCase
    }
    
    //MARK: Private Helpers
    private func executeMoviesUseCase() {
        moviesListUseCase.execute { cachedResult in
            switch cachedResult {
                
            case .success(let cachedData):
                print("Got Cached Data \(cachedData)")
            case .failure(let failure):
                print("Got Cached Data failure \(failure)")
            }
        } apiData: { apiResult in
            
            switch apiResult {
            case .success(let apiData):
//                print("Got Api Data \(apiData)")
                self.filmsModel = apiData
            case .failure(let failure):
                print("Got Api Data failure \(failure)")
            }
            
        }


    }
    
    
}

//MARK : - ViewController Input
extension MoviesListViewModel {
    
    func getMovies() {
        executeMoviesUseCase()
    }
    
}
