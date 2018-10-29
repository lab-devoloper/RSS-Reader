//
//  NewsListViewControllerConfigurator.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import Foundation

import UIKit

class NewsListViewControllerConfigurator {
    
    func configureViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? NewsListViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: NewsListViewController) {
        
        let networkClient = NetworkClient()
        
        let service = NewsListService()
        service.networkClient = networkClient
        let router = NewsListRouter(newsListViewController: viewController)
        
        let presenter = NewsListPresenter()
        presenter.service = service
        presenter.view = viewController
        viewController.presenter = presenter
        presenter.router = router
    }
}
