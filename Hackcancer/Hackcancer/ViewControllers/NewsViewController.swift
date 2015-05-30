//
//  NewsViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 27/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController
{
    lazy var adapter: NewsTableViewAdapter =
    {
        return NewsTableViewAdapter(tableView: self.tableView)
    }()
    
    lazy var tableView: UITableView =
    {
       return UITableView(frame: self.view.bounds)
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("news_nav", comment:"Title for NewsViewController")
    
        adapter.delegate = self
        
        view.addSubview(tableView)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

extension NewsViewController: NewsTableViewAdapterDelegate
{
    func adapter(adapter: NewsTableViewAdapter, didSelectItem item: NewsItem)
    {
        let newsItemViewController = NewsItemViewController(item: item)
        navigationController?.pushViewController(newsItemViewController, animated: true)
    }
}