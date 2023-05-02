//
//  MotivationalMoviesUseCase.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol MoviesListUseCase {
    func execute(page: Int, cachedData: (Result<[FilmsListModel], Error>) -> Void, apiData: @escaping (Result<[FilmsListModel], Error>) -> Void)
}

//MARK : - MotivationalMoviesUseCase
final class MoviesListUseCaseImpl {
    
    private let moviesListRepository: MoviesListRepository
    private var isRequestAlreadyLoading = false
    
    init(moviesListRepository: MoviesListRepository) {
        self.moviesListRepository = moviesListRepository
    }
    
    private func convertToDomain(movies: [MoviesListDTO]) -> [FilmsListModel] {
        return movies.map { $0.toDomain() }
    }
    
}

extension MoviesListUseCaseImpl: MoviesListUseCase {
    
    typealias MoviesList = (Result<[FilmsListModel], Error>) -> Void
    
    func execute(page: Int, cachedData: MoviesList, apiData: @escaping MoviesList) {
        guard !isRequestAlreadyLoading else { return }
        self.isRequestAlreadyLoading = true
        moviesListRepository.fetchMovieList(page: page) { cachedResult in
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
            self.isRequestAlreadyLoading = false
        }

        
    }
    
    
}
