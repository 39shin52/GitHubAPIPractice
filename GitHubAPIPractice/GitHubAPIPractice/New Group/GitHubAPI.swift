//
//  GitHubAPI.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/28.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

final class GitHubAPI {
    struct SearchRepositories: GitHubRequest {
        let keyword: String
        
        //GitHubRequestが要求する連想型
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod{
            return .get
        }
        
        var path: String{
            return "/search/repositries"
        }
        
        var queryItems: [URLQueryItem]{
            return [URLQueryItem(name: "q", value: keyword)]
        }
    }
    
    struct SearchUsers : GitHubRequest{
        
        let keyword: String
        
        typealias Response = SearchResponse<User>
        
        var method: HTTPMethod{
            return.get
        }
        
        var path: String{
            return "/search/users"
        }
        
        var queryItems: [URLQueryItem]{
            return [URLQueryItem(name: "q", value: keyword)]
        }
    }
}
