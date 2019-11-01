//
//  SearchResponse.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

struct SearchResponse<Item:Decodable>: Decodable{
    let totalCount:Int
    let items:[Item]
    
    enum CodingKeys:String, CodingKey{
        case totalCount = "total_count"
        case items
    }
}
