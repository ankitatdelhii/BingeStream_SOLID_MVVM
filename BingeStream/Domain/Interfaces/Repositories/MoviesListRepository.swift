//
//  MoviesListRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol MoviesListRepository {
    func fetchMovieList(cached: (Result<[MoviesListDTO], Error>)-> Void, api: @escaping (Result<[MoviesListDTO], Error>) -> Void)
}
