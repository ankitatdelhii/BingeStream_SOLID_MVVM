//
//  NetworkDispatcher.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

protocol NetworkDispatcher {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func execute(request: URLRequestConvertible, completion: @escaping CompletionHandler)
}
