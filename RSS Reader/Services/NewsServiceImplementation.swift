//
//  NewsListServiceImplementation.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 23/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import SWXMLHash

class NewsListService: NewsListServiceProtocol {
    
    var networkClient: NetworkProtocol!

    func updateNewsList(_ completion: @escaping ([RSSObject]) -> Void) {

        networkClient.loadData { (result) in
            
            let xml = SWXMLHash.parse(result.value ?? "")
            var news = [RSSObject]()
            
            for item in xml["rss"]["channel"]["item"].all {
                news.append(RSSObject(xml: item))
            }
            
            completion(news)
        }
    }
    
    func setupRssChennel(urlPatch: String) {
        self.networkClient.urlPath = urlPatch
    }
}
