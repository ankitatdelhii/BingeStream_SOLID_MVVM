//
//  MoviesListRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

protocol MoviesListRepository {
    func fetchMovieList(cached: (Result<[MoviesListModel], Error>)-> Void, api: @escaping (Result<[MoviesListModel], Error>) -> Void)
}
