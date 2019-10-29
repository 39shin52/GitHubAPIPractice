//
//  GitHubClient.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/29.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation
class GitHubClient{
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func send<Request: GitHubRequest>(request: Request, completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest){
            data, response, error in
            
            switch (data, response, error){
            case (_,_,let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?,_): do {
                let response = try request.responce(from: data, urlResponce: response)
                
                completion(Result(value: response))
            } catch let error as GitHubAPIError{
                
                completion(Result(error: .apiError(error)))
            } catch {
                
                completion(Result(error: .responseParseError(error)))
                }
                default:
                fatalError("invalid response combination\(data), \(response), \(error).")
                }
            }
        }
        
        task.resume()
    }
}
