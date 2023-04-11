//
//  URLSessionNetworkDispatcher.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

class URLSessionNetworkDispatcher: NetworkDispatcher {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func execute(request: URLRequestConvertible, completion: @escaping CompletionHandler) {
        let urlRequest = request.asURLRequest()
        let task = session.dataTask(with: urlRequest, completionHandler: completion)
        task.resume()
    }
}
