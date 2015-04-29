//
//  NewsViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import ReactiveCocoa
import UIKit

class NewsViewController: UIViewController
{
    lazy var tableView: UITableView =
    {
        let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        return tableView
    }()
    
    lazy var newsTableViewAdapter: NewsTableViewAdapter =
    {
        let adapter = NewsTableViewAdapter()
        return adapter
    }()
    
    lazy var newsStore: NewsStore =
    {
        return NewsStore()
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("news_nav", comment: "")
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func loadView()
    {
        view = tableView
    }
    
    override func viewDidLoad()
    {
        tableView.dataSource = newsTableViewAdapter
        tableView.delegate = newsTableViewAdapter
        
        newsTableViewAdapter.tableView = tableView
        newsStore.fetchAllItems()?.start(next:
        {
            if let items = $0
            {
                self.newsTableViewAdapter.setItems(items, animated:false)
            }
        })
        
        newsTableViewAdapter.selectionAction = Action
        {
            item in
            
            return SignalProducer
            {
                observer, disposable in
                let viewController = NewsItemViewController(item:item)
                self.navigationController?.pushViewController(viewController, animated: true)
                sendCompleted(observer)
            }
        }
    }
}