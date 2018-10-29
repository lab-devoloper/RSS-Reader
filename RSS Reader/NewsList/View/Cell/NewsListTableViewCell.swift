//
//  NewsListTableViewCell.swift
//  NewsList Test
//
//  Created by Ivan Mikhailovskii on 01.07.2018.
//  Copyright © 2018 Ivan Mikhailovskii. All rights reserved.
//

import UIKit
import Kingfisher
import Atributika

class NewsListTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureConstraintHeight: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openNewsButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: AttributedLabel!
    
    var news:RSSObject?
    var openUrl: ((String) -> (Void))!
    var openDetailNews: ((RSSObject) -> (Void))!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func openDetailNewsButton(_ sender: Any) {
        
        if let newsOpen = self.news {
            self.openDetailNews(newsOpen)
        }
    }
    
    func setupCell(news: RSSObject?) {
        
        self.news = news
        
        self.setupImage(url: news?.urlImage)
        self.titleLabel.text = news?.title
        self.setupViewCell(isOpen: news?.isOpen)
        self.setupDescription(text: news?.description)
        self.setupDate(date: news?.publishedAt)
    }
    
    func setupImage(url: URL?) {
        
        if let imageUrl = url {
            self.pictureImageView.kf.setImage(with: imageUrl)
            self.pictureConstraintHeight.constant = 100
        } else {
            self.pictureConstraintHeight.constant = 0
        }
    }
    
    func setupViewCell(isOpen: Bool?) {
        
        if isOpen ?? false {
            self.descriptionLabel.numberOfLines = 0
            self.openNewsButtonWidthConstraint.constant = 0
        } else  {
            self.descriptionLabel.numberOfLines = 3
            self.openNewsButtonWidthConstraint.constant = 30
        }
    }
    
    func setupDate(date: Date?) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let myString = formatter.string(from: date ?? Date())
        
        self.dateLabel.text = myString
    }
    
    func setupDescription(text: String?) {
        
        let linkStyle = Style("a")
            .foregroundColor(.blue, .normal)
            .foregroundColor(.brown, .highlighted)
        
        self.descriptionLabel.attributedText = text?
            .style(tags: linkStyle)
            .styleHashtags(linkStyle)
            .styleMentions(linkStyle)
            .styleLinks(linkStyle)
        
        self.descriptionLabel.onClick = { label, detection in
            switch detection.type {
            case .link(let url):
                self.openUrl(url.path)
            case .tag(let tag):
                if tag.name == "a", let href = tag.attributes["href"] {
                    self.openUrl(href)
                }
            default:
                break
            }
        }
    }
    
}

