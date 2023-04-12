//
//  MoviesModel.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

struct MoviesListModel: Codable {
    let id: String
    let name: String
    let genre: MoviesGenre
}

enum MoviesGenre: Codable {
    case Motivatioal
    case Other
}
