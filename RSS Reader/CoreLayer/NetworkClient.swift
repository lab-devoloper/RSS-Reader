//
//  NetworkClient.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 23/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import Alamofire

class NetworkClient: NetworkProtocol {
    
    var urlPath: String = "https://habr.com/rss/hubs/all/" 
    
    func loadData(completion: @escaping (Result<String>) -> Void) {
        
        Alamofire.request(self.urlPath).responseString { (response) in
            
            if response.result.isSuccess {
                completion(response.result)
            } else {
                print(response.error ?? "")
            }
        }
    }
}
