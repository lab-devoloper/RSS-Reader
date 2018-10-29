//
//  NewsDetailPresenter.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

class NewsDetailPresenter: NewsDetailViewControllerOutputProtocol {
    
    weak var view: NewsDetailViewControllerInputProtocol!
    var news: RSSObject!
    
    func viewDidLoad() {
        
        self.view.displayDescription(text: news.description ?? "")
        self.view.displayTitle(text: news.title ?? "")
    }
    
}
