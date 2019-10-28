//
//  Repositry.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

struct Repositry:Decodable{
    let id:Int
    let name:String
    let fullName:String
    let Owner:User
    
    enum CodingKets:String,CodingKey{
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
