//
//  ConciergeViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

class ConciergeViewController: UIViewController
{
    lazy var tableView: UITableView =
    {
        let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        return tableView
    }()
    
    lazy var conciergeTableViewAdapter: ConciergeTableViewAdapter =
    {
        let adapter = ConciergeTableViewAdapter()
        return adapter
    }()
    
    lazy var conciergeStore: ConciergeStore =
    {
        return ConciergeStore()
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("concierge_nav", comment: "")
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
        tableView.dataSource = conciergeTableViewAdapter
        tableView.delegate = conciergeTableViewAdapter
        
        conciergeTableViewAdapter.tableView = tableView
        conciergeTableViewAdapter.setItems(conciergeStore.allItems(), animated:false)
    }
}