//
//  NewsListServiceProtocol.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 23/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

protocol NewsListServiceProtocol {
    
    func updateNewsList(_ completion:@escaping ([RSSObject]) -> Void)
    func setupRssChennel(urlPatch: String)
}
