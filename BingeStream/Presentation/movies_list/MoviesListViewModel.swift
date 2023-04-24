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
    var moviesListUpdate: (([FilmsListModel]) -> Void)? { get }
}

typealias MoviesListViewModelOutcomes = MoviesListViewModelInput & MoviesListViewModelOutput

final class MoviesListViewModel: MoviesListViewModelOutcomes {
    
    //MARK: Private Properties
    private let moviesListUseCase: MoviesListUseCase
    
    //MARK: Binders
    var moviesListUpdate: (([FilmsListModel]) -> Void)?
    
    init(moviesListUseCase: MoviesListUseCase) {
        self.moviesListUseCase = moviesListUseCase
    }
    
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
                print("Got Api Data \(apiData)")
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
