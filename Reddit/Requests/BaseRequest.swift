//
//  BaseRequest.swift
//  Reddit
//
//  Created by Folarin Williamson on 10/10/20.
//

import Foundation

typealias RequestCompletionHandler = (Result<Data, Error>) -> Void

enum RequestError: Error {
    case dataMissing
    case parse
}

enum RequestMethod: String {
    case get = "GET"
}

// MARK: APIRequest
protocol APIRequest {
    var url: String { get }
    var method: RequestMethod { get }
}

// MARK: BaseRequest
struct BaseRequest {
    static func execute(_ request: APIRequest, session: URLSession = .shared, completion: @escaping RequestCompletionHandler) {
        guard let url = URL(string: request.url) else {
            fatalError("BaseRequest; unable to set url")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                if let responseError = error {
                    completion(.failure(responseError))
                }
                return
            }
            
            guard let data = data else {
                completion(.failure(RequestError.dataMissing))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
