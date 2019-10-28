//
//  GitHubRequest.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/27.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    var baseURL: URL{ get }
}

extension GitHubRequest{
    var baseURL:URL{
        return URL(string: "https://api.github.com")!
    }
}
