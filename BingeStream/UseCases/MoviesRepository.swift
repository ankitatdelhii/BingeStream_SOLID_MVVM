//
//  MoviesRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

protocol MoviesRepository {
    func fetchMovies(moviesData: @escaping ([MoviesModel]) -> Void)
}
