//
//  Repositry.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//


struct Repository:Decodable{
    let id:Int
    let name:String
    let fullName:String
    let owner:User
    
    enum CodingKeys:String,CodingKey{
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
