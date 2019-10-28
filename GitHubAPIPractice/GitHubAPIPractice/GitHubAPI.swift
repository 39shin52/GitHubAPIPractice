//
//  GitHubAPI.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/28.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

final class GitHubAPI{
    struct SearchResitrues: GitHubRequest{
        
        let keyWord: String
        
        //GitHubRequestが要求する連想型
        typealias Response = SearchResponse<Repositry>
        
        var method: HTTPMethod{
            return .get
        }
        
        var path: String{
            return "/search/repositry"
        }
        
        var queryItems: [URLQueryItem]{
            return [URLQueryItem(name: "q", value: keyWord)]
        }
    }
    struct SearchUsers: GitHubRequest {
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
