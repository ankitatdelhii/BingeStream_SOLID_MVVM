//
//  APIEndpoint.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

struct APIEndpoint {
    let path: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    let headers: [String: String]?
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
