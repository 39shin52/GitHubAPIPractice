//
//  GitHun.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

struct GitHubAPIError:Decodable,Error{
    struct FieldError:Decodable{
        let resource:String
        let field:String
    }
    
    let message:String
    let fieldErrors:[FieldError]
}

enum GitHubClientError:Error{
    //通信に失敗
    case connectionError(Error)
    
    //レスポンスの解釈に失敗
    case responseParseError(Error)
    
    //APIからエラーレスポンスを受けとった
    case apiError(Error)
}
