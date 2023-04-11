//
//  NetworkError.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

enum NetworkError: Error {
    case unknownError
    case invalidURL
    case noData
    case requestFailed(Error)
    case decodingError(Error)
}
