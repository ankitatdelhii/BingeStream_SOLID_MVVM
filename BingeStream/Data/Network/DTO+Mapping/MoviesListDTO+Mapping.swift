//
//  MoviesListDTO+Mapping.swift
//  BingeStream
//
//  Created by Ankit Saxena on 24/04/23.
//

import Foundation

//MARK: - MoviesList Data Transfer Object

struct MoviesListDTO: Codable {
    let id: Int
    let name: String
    let description: String
    let actors: [String]
    let director: String
    let poster_url: String
}

//MARK: - Mappings to Domain
extension MoviesListDTO {
    
    func toDomain() -> FilmsListModel {
        return FilmsListModel(id: "\(self.id)",
                              title: self.name,
                              actors: self.actors.joined(separator: ", "),
                              director: self.director,
                              description: self.description)
    }
    
}
