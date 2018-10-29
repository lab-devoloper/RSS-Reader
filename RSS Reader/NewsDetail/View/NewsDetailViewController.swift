//
//  NewsDetailViewController.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 24/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import UIKit
import Atributika

class NewsDetailViewController: UIViewController, NewsDetailViewControllerInputProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: AttributedLabel!
    var configurator: NewsDetailConfiguratorProtocol!
    var presenter: NewsDetailViewControllerOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator.configure(newsDetailViewController: self)
        self.presenter.viewDidLoad()
    }
    
    func displayTitle(text: String) {
        self.titleLabel.text = text
    }
    
    func displayDescription(text: String) {
        
        let link = Style("a")
            .foregroundColor(.blue, .normal)
            .foregroundColor(.brown, .highlighted)
        
        self.descriptionLabel.numberOfLines = 0
        
        self.descriptionLabel.attributedText = text
            .style(tags: link)
            .styleHashtags(link)
            .styleMentions(link)
            .styleLinks(link)
        
        self.descriptionLabel.onClick = { label, detection in
            switch detection.type {
            case .link(let url):
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            case .tag(let tag):
                if tag.name == "a", let href = tag.attributes["href"], let url = URL(string: href) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            default:
                break
            }
        }
    }
}
