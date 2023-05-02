//
//  MoviesListViewModel.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import Foundation

protocol MoviesListViewModelInputProperties {
    //All are private set and weak in case of delegates
    var outputDelegate: MoviesListViewModelOutput? { get }
    var filmsModel: [FilmsListModel] { get }
}

protocol MoviesListViewModelInputMethods {
    func checkForMoreMovies(currentItem: Int)
}

protocol MoviesListViewModelOutput: AnyObject {
    func moviesDataUpdated()
}

typealias MoviesListViewModelOutcomes = MoviesListViewModelInputProperties & MoviesListViewModelInputMethods

final class MoviesListViewModel: MoviesListViewModelOutcomes {
    
    //MARK: Private Properties
    private(set) weak var outputDelegate: MoviesListViewModelOutput?
    private(set) var filmsModel = [FilmsListModel]() {
        didSet {
            outputDelegate?.moviesDataUpdated()
        }
    }
    
    //Use Cases
    private let moviesListUseCase: MoviesListUseCase
    
    
    //MARK: Lifecycle
    init(moviesListUseCase: MoviesListUseCase, outputDelegate: MoviesListViewModelOutput) {
        self.moviesListUseCase = moviesListUseCase
        self.outputDelegate = outputDelegate
        executeMoviesUseCase()
    }
    
    //MARK: Private Helpers
    private func executeMoviesUseCase() {
        moviesListUseCase.execute { cachedResult in
            switch cachedResult {
                
            case .success(let cachedData):
                print("Got Cached Data \(cachedData)")
                self.filmsModel = cachedData
            case .failure(let failure):
                print("Got Cached Data failure \(failure)")
            }
        } apiData: { apiResult in
            
            switch apiResult {
            case .success(let apiData):
                self.filmsModel = apiData
                print("Api data \(apiData)")
            case .failure(let failure):
                print("Got Api Data failure \(failure)")
            }
            
        }


    }
    
    
}

//MARK : - ViewController Input Methods
extension MoviesListViewModel {
    
    func checkForMoreMovies(currentItem: Int) {
        if currentItem == (filmsModel.count - 1) {
            print("Load more movies")
//            executeMoviesUseCase()
        }
    }
    
}
