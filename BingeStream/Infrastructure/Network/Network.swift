//
//  Network.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//
/*
import Foundation

// MARK: - Protocols
 
protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest
}

protocol NetworkDispatcher {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    func execute(request: URLRequestConvertible, completion: @escaping CompletionHandler)
}

// MARK: - Models

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

// MARK: - URLRequestConvertible Implementation

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

// MARK: - NetworkDispatcher Implementation

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

// MARK: - Network Client

class NetworkClient {
    private let dispatcher: NetworkDispatcher

    init(dispatcher: NetworkDispatcher) {
        self.dispatcher = dispatcher
    }

    func request(endpoint: APIEndpoint, completion: @escaping (Result<Data, Error>) -> Void) {
        dispatcher.execute(request: endpoint) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error"])))
            }
        }
    }
}


// MARK: - End
//end----------------------------------------------

// Usage
let endpoint = APIEndpoint(path: "https://api.example.com/data", method: .get, parameters: ["key": "value"], headers: ["Content-Type": "application/json"])
let dispatcher = URLSessionNetworkDispatcher()
let client = NetworkClient(dispatcher: dispatcher)

client.request(endpoint: endpoint) { (result) in
    switch result {
    case .success(let data):
        print("Data received: \(data)")
    case .failure(let error):
        print("Error: \(error.localizedDescription)")
    }
}
*/
