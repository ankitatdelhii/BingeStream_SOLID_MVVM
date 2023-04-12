//
//  MotivationalMoviesUseCase.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol MotivationalMoviesUseCase {
    associatedtype MoviesList = (Result<[MoviesListModel], Error>) -> Void
    func execute(cachedData: MoviesList, apiData: MoviesList)
}

//MARK : - MotivationalMoviesUseCase
final class MotivationalMoviesUseCaseImpl {
    
    private let moviesListRepository: MoviesListRepository
    
    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    private func filterMotivationalMovies(movies: [MoviesListModel]) -> [MoviesListModel] {
        return movies.filter({ $0.genre == .Motivatioal })
    }
    
}

extension MotivationalMoviesUseCaseImpl: MotivationalMoviesUseCase {
    
    typealias MoviesList = (Result<[MoviesListModel], Error>) -> Void
    
    func execute(cachedData: MoviesList, apiData: @escaping MoviesList) {
        
        moviesListRepository.fetchMovieList { cachedResult in
            switch cachedResult {
                
            case .success(let moviesModel):
                let motivationalMovies = self.filterMotivationalMovies(movies: moviesModel)
                cachedData(.success(motivationalMovies))
            case .failure(let error):
                cachedData(.failure(error))
            }
        } api: { apiResult in
            switch apiResult {
                
            case .success(let moviesModel):
                let motivationalMovies = self.filterMotivationalMovies(movies: moviesModel)
                apiData(.success(motivationalMovies))
            case .failure(let error):
                apiData(.failure(error))
            }
        }

        
    }
    
    
}
