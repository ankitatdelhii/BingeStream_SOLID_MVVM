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
        return APIEndpoint(
            path: "https:example.com",
            method: .get,
            urlParameters: ["list": 2],
            headers: ["Content-Type": "json"]
        )
    }
    
    func getNasaImages() -> APIEndpoint {
        return APIEndpoint(
            path: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos",
            method: .get,
            urlParameters: ["sol" : 1000, "api_key" : "DEMO_KEY"],
            headers: ["Content-Type": "json"]
        )
    }
    
}
