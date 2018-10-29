//
//  NewsDetailConfigurator.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

class NewsDetailConfigurator: NewsDetailConfiguratorProtocol {
    
    let news: RSSObject
    
    init(news: RSSObject) {
        self.news = news
    }
    
    func configure(newsDetailViewController: NewsDetailViewController) {
        
        let presetner = NewsDetailPresenter()
        presetner.view = newsDetailViewController
        presetner.news = self.news
        newsDetailViewController.presenter = presetner
    }
}
