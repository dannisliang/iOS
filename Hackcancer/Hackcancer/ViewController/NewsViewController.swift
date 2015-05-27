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
    lazy var store: NewsItemStore =
    {
       return NewsItemStore()
    }()
    
    lazy var tableView: UITableView =
    {
       return UITableView(frame: self.view.bounds)
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("news_nav", comment:"Title for NewsViewController")
        
        view.addSubview(tableView)
        
        store.fetchAllItems()
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