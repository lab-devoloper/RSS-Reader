//
//  LoadingView.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 29/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import UIKit

class LoadingView {
    
    static let loadingView = LoadingView()
    
    private var activityIndicator: UIActivityIndicatorView?
    private var style: UIActivityIndicatorView.Style!
    private let color: UIColor!
    private let backgroundColor: UIColor!
    
    init() {
        self.style = UIActivityIndicatorView.Style.whiteLarge
        self.color = UIColor.white
        self.backgroundColor = UIColor(white: 0.0, alpha: 0.20)
    }
    
    var state: Bool {
        get {
            return activityIndicator != nil
        }
    }
    
    func addActivityIndicator(_ view: UIView, style: UIActivityIndicatorView.Style?, color: UIColor?, backgroundColor: UIColor?) {
        
        DispatchQueue.main.async {
            guard self.activityIndicator == nil else { return }
            self.activityIndicator = UIActivityIndicatorView(frame: view.bounds)
            self.activityIndicator!.style = (style != nil) ? style! : self.style
            self.activityIndicator!.color = (color != nil) ? color! : self.color
            self.activityIndicator!.backgroundColor = (backgroundColor != nil) ? backgroundColor! : self.backgroundColor
            self.activityIndicator!.startAnimating()
            view.addSubview(self.activityIndicator!)
        }
    }
    
    func removeActivityIndicator() {
        
        DispatchQueue.main.async {
            guard self.activityIndicator != nil else { return }
            self.activityIndicator!.removeFromSuperview()
            self.activityIndicator = nil
        }
    }
}

