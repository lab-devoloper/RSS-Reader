//
//  NewsListViewController.swift
//  RSS Reader
//
//  Created by Ivan Mihailovskii on 23/10/2018.
//  Copyright © 2018 Ivan Mihailovskii. All rights reserved.
//

import UIKit

//MARK: Добавить марков, разделить имим функционал (аутпуты, инпуты и т д)
class NewsListViewController: UIViewController, NewsListViewControllerInputProtocol {

    @IBOutlet weak var tableView: UITableView!
    var presenter: NewsListViewControllerOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let identifier = "NewsListTableViewCell"
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        self.presenter.updateNews()
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func loadingView() {
        
        if LoadingView.loadingView.state {
            LoadingView.loadingView.removeActivityIndicator()
        } else {
            LoadingView.loadingView.addActivityIndicator(self.view, style: .gray, color: nil, backgroundColor: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.router.prepare(for: segue, sender: sender)
    }
    
    @IBAction func rightBarButtonPressed(_ sender: Any) {
        self.presenter.changeRssChannel()
    }
}

extension NewsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.presenter.didSelect(row: indexPath.row)
        self.tableView.beginUpdates()
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        self.tableView.endUpdates()
    }
}

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.countNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "NewsListTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? NewsListTableViewCell {
        
            cell.setupCell(news: self.presenter.getNews(index: indexPath.row))
            cell.openUrl = { (url) in
                self.presenter.openUrl(url: url);
            }
            cell.openDetailNews = { (news) in
                self.presenter.openDetailNews(news: news)
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
