//
//  NewsListRouter.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

protocol NewsListRouterProtocol: ViewRouter {
    
    func presentDetailsView(for news: RSSObject)
    func viewAlert(_ completion:@escaping (String) -> Void)
    func openUrl(url: String)
}
