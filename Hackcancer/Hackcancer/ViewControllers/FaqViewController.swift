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
    lazy var adapter: FaqTableViewAdapter =
    {
        return FaqTableViewAdapter(tableView: self.tableView)
    }()
    
    lazy var tableView: UITableView =
    {
        return UITableView(frame: self.view.bounds)
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("faq_nav", comment:"Title for FaqViewController")
        
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
    
    override func viewWillAppear(animated: Bool)
    {
        var inset: UIEdgeInsets = UIEdgeInsetsZero
        
        var statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        inset.top = statusBarHeight
        
        if let navigationController = self.navigationController
        {
            inset.top += navigationController.navigationBar.frame.height
        }
        
        tableView.contentInset = inset
    }
}

extension FaqViewController: FaqTableViewAdapterDelegate
{
    func adapter(adapter: FaqTableViewAdapter, didSelectItem item: FaqItem)
    {
    }
}