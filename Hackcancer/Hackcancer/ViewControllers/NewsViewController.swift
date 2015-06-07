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
    var adapter: NewsTableViewAdapter?
    @IBOutlet var tableView: UITableView?
    
    override func awakeFromNib()
    {
        title = NSLocalizedString("news_nav", comment:"Title for NewsViewController")
        
        if let tableView = self.tableView
        {
            adapter = NewsTableViewAdapter(tableView: tableView)
            adapter?.delegate = self
        }
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