//
//  GitHun.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

enum GitHubClientError:Error{
    //通信に失敗
    case connectionError(Error)
    
    //レスポンスの解釈に失敗
    case responseParseError(Error)
    
    //APIからエラーレスポンスを受けとった
    case apiError(Error)
}
