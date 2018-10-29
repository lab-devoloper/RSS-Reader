//
//  RSSObject.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 23/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import Foundation
import SWXMLHash

class RSSObject {
    
    var title: String?
    var isOpen = false
    var description: String?
    var urlImage: URL?
    var urlNewsLink: URL?
    var publishedAt: Date?
    
    init() {}
    
    init(xml: XMLIndexer)
    {
        if let title = xml["title"].element?.text {
            self.title = title
        }
        
        if let description = xml["description"].element?.text {
            
            let trimmedString = description.trimmingCharacters(in: .whitespacesAndNewlines)
            self.description = trimmedString
        }
        
        if let publishedAt = xml["pubDate"].element?.text {
            self.publishedAt = self.converStringToDate(str: publishedAt)
        }
        
        if let urlToImage = xml["itunes:image"].element, let url = urlToImage.attribute(by: "href")?.text {
            self.urlImage = URL(string: url)
        }
        
        if let url = xml["link"].element?.text {
            self.urlNewsLink = URL(string: url)
        }
    }
    
    private func converStringToDate(str: String) -> Date?
    {
        let dateFormatter = DateFormatter()
        let formatTypes = ["E, d MMM yyyy HH:mm:ss Z", "yyyy-MM-dd'T'HH:mm:ssZ"]
        
        for format in formatTypes {
            dateFormatter.dateFormat = format
            if let date = dateFormatter.date(from: str) {
                return date
            }
        }
        
        return nil
    }
}
