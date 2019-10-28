//
//  SearchResponse.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

struct SearchResponse<Item:Decodable>{
    let totalCount:Int
    let item:[Item]
    
    enum CodingKeys:String, CodingKey{
        case totalCount = "total_count"
        case items
    }
}
