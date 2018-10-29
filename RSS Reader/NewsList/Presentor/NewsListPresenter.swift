//
//  NewsListPresentor.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

class NewsListPresenter: NewsListViewControllerOutputProtocol {

    weak var view: NewsListViewControllerInputProtocol!
    var service: NewsListServiceProtocol!
    internal var router: NewsListRouterProtocol!
    var newsArray: [RSSObject]?
    
    var isLoading: Bool! = false {
        didSet {
            self.view.loadingView()
        }
    }
    
    func updateNews() {
        
        self.isLoading = true
        self.service.updateNewsList { (result) in
            
            self.newsArray = result.sorted(by: { $0.publishedAt?.timeIntervalSince1970 ?? 0 >
                                                 $1.publishedAt?.timeIntervalSince1970 ?? 0 })
            self.view.reloadTableView()
            self.isLoading = false
        }
    }
    
    func countNews() -> Int {
        return self.newsArray?.count ?? 0
    }
    
    func getNews(index: Int) -> RSSObject {
        return self.newsArray?[index] ?? RSSObject()
    }
    
    func didSelect(row: Int) {
        
        if let isOpen = self.newsArray?[row].isOpen, isOpen {
            self.newsArray?[row].isOpen = false
        } else {
            self.newsArray?[row].isOpen = true
        }
    }
    
    func openDetailNews(news: RSSObject) {
        self.router.presentDetailsView(for: news)
    }
    
    func changeRssChannel() {
        
        self.router.viewAlert { (urlPath) in
            self.service.setupRssChennel(urlPatch: urlPath)
            self.updateNews()
        }

    }
    
    func openUrl(url: String) {
        self.router.openUrl(url: url)
    }
}

