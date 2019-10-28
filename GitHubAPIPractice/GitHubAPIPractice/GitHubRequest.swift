//
//  GitHubRequest.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/27.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    associatedtype Response:Decodable
    
    var baseURL:URL{ get }
    var path:String{ get }
    var method:HTTPMethod{ get }
    var queryItems:[URLQueryItem] { get }
    var body:Encodable?{ get }
    
}

extension GitHubRequest{
    var baseURL:URL{
        return URL(string: "https://api.github.com")!
    }
    
    func buildURLRequest() -> URLRequest{
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: resolvingAgainstBaseURL: true)
        
        switch method {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func responce(from data: Data, urlResponce: URLResponse) throws -> Response {
        let decoder = JSONDecoder()
        
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode{
            //JSONからモデルをインスタンス化
            return try decoder.decode(Response.self, from: data)
        } else {
            //JSONからAPIエラーをインスタンス化
            throw try decoder.decode(GitHubAPIError.self, from: data)
        }
    }
}
