//
//  Result.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/29.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

enum Result<T, Error: Swift.Error>{
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}
