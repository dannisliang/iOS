//
//  FaqViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class FaqViewController: UIViewController
{
    var adapter: FaqTableViewAdapter?
    @IBOutlet var tableView: UITableView?
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("faq_nav", comment:"Title for FaqViewController")
        
        if let tableView = self.tableView
        {
            adapter = FaqTableViewAdapter(tableView: tableView)
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

extension FaqViewController: FaqTableViewAdapterDelegate
{
    func adapter(adapter: FaqTableViewAdapter, didSelectItem item: FaqItem)
    {
    }
}