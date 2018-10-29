//
//  NewsListViewControllerInitializer.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import UIKit

class NewsListViewControllerInitializer: NSObject {
    @IBOutlet weak var NewsListViewController: NewsListViewController!
    
    override func awakeFromNib() {
        let configurator = NewsListViewControllerConfigurator()
        configurator.configureViewInput(viewInput: NewsListViewController)
    }
}
