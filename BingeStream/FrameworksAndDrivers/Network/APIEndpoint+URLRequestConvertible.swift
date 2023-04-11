//
//  APIEndpoint+URLRequestConvertible.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//

import Foundation

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
            if let parameters = parameters {
                let queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
                components?.queryItems = queryItems
                request.url = components?.url
            }
        case .post:
            if let parameters = parameters {
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                request.httpBody = bodyData
            }
        }

        return request
    }
}
