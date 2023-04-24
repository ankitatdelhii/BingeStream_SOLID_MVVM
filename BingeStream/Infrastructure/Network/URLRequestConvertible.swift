//
//  URLRequestConvertible.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

//MARK : - APIEndPoint + URLRequestConvertible
extension APIEndpoint: URLRequestConvertible {
    func asURLRequest() -> URLRequest {
        let url = URL(string: path)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }

        switch method {
        case .get:
//            if let parameters = urlParameters {
//                let queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
//                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
//                components?.queryItems = queryItems
//                request.url = components?.url
//            }
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            request.url = components?.url
        case .post:
            if let parameters = urlParameters {
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.httpBody = bodyData
            }
        }

        return request
    }
}
