//
//  NewsListRouter.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import Foundation
import UIKit

class NewsListRouter: NewsListRouterProtocol {
   
    weak var newsListViewController: NewsListViewController?
    var news: RSSObject!
    
    init(newsListViewController: NewsListViewController) {
        self.newsListViewController = newsListViewController
    }
    
    func presentDetailsView(for news: RSSObject) {
        
        self.news = news;
        self.newsListViewController?.performSegue(withIdentifier: "NewsDetailControllerSeque", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let newsDetailViewController = segue.destination as? NewsDetailViewController {
            newsDetailViewController.configurator = NewsDetailConfigurator(news: news)
        }
    }
    
    func openUrl(url: String) {
        UIApplication.shared.open(URL(string:url)!, options: [:], completionHandler: nil)
    }
    
    func viewAlert(_ completion:@escaping (String) -> Void)
    {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Meduza", style: .default) { (action) in
            completion("https://meduza.io/rss/podcasts/meduza-v-kurse")
        })
        
        alert.addAction(UIAlertAction(title: "Habr", style: .default) { (action) in
            completion("https://habr.com/rss/hubs/all/")
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { (action) in })
        
        self.newsListViewController?.present(alert, animated: true, completion: nil)
    }
}
