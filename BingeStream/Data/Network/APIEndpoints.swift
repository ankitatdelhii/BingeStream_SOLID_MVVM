//
//  APIEndpoints.swift
//  BingeStream
//
//  Created by Ankit Saxena on 13/04/23.
//

import Foundation

struct APIEndpoints {
    //rm Add Base URL Path with Config
    func getMoviesList() -> APIEndpoint {
        return APIEndpoint(path: "https:example.com",
                           method: .get,
                           urlParameters: ["list": 2],
                           headers: ["Content-Type": "json"])
    }
    
}
