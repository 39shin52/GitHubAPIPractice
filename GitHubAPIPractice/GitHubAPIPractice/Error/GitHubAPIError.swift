//
//  GitHubAPIError.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/31.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

struct GitHubAPIError: Decodable, Error {
    struct FieldError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
    let message: String
    let fieldErrors: [FieldError]
}
