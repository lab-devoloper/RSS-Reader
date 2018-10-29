//
//  NewsListViewControllerOutputProtocol.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

protocol NewsListViewControllerOutputProtocol {
    
    var router: NewsListRouterProtocol! {get}
    var isLoading: Bool! {get}
    func updateNews()
    func didSelect(row: Int)
    func changeRssChannel()
    func openUrl(url: String)
    func countNews() -> Int
    func getNews(index: Int) -> RSSObject
    func openDetailNews(news: RSSObject)
}
