//
//  MotivationalMoviesUseCase.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol MoviesListUseCase {
    func execute(cachedData: (Result<[FilmsListModel], Error>) -> Void, apiData: @escaping (Result<[FilmsListModel], Error>) -> Void)
}

//MARK : - MotivationalMoviesUseCase
final class MoviesListUseCaseImpl {
    
    private let moviesListRepository: MoviesListRepository
    
    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    private func convertToDomain(movies: [MoviesListDTO]) -> [FilmsListModel] {
        return movies.map { $0.toDomain() }
    }
    
}

extension MoviesListUseCaseImpl: MoviesListUseCase {
    
    typealias MoviesList = (Result<[FilmsListModel], Error>) -> Void
    
    func execute(cachedData: MoviesList, apiData: @escaping MoviesList) {
        
        moviesListRepository.fetchMovieList { cachedResult in
            switch cachedResult {
                
            case .success(let moviesModel):
                let filmsModel = self.convertToDomain(movies: moviesModel)
                cachedData(.success(filmsModel))
            case .failure(let error):
                cachedData(.failure(error))
            }
        } api: { apiResult in
            switch apiResult {
                
            case .success(let moviesModel):
                let filmsModel = self.convertToDomain(movies: moviesModel)
                apiData(.success(filmsModel))
            case .failure(let error):
                apiData(.failure(error))
            }
        }

        
    }
    
    
}
