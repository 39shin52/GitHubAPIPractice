//
//  main.swift
//  GitHubAPIPractice
//
//  Created by Itou Shingo on 2019/10/26.
//  Copyright © 2019 Itou Shingo. All rights reserved.
//

import Foundation

print("Enter your query here>", terminator: "")

//入力されたクエリの取得
guard let keyword = readLine(strippingNewline: true) else {
    exit(1)
}


//APIクライアントの生成
let cilent = GitHubClient()

//リクエストの発行
let request = GitHubAPI.SearchRepositories(keyword: keyword)

//リクエストの送信
cilent.send(request: request) { result in
    switch result {
    case let .success(response):
        for item in response.items {
            //リポジトリのあ所有者と名前を出力
            print(item.owner.login + "/" + item.name)
        }
        exit(0)
        
    case let .failure(error):
        //エラー詳細を出力
        print(error)
        exit (1)
    }
}

//タイムアウト時間
let timeoutInterval: TimeInterval = 60

//タイムアウトまでメインスレッド停止
Thread.sleep(forTimeInterval: timeoutInterval)

//タイムアウト後の処理
print("Connection timeout")
exit(1)

