//
//  ConciergeViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 31/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ConciergeViewController: UIViewController
{
    lazy var adapter: ConciergeTableViewAdapter =
    {
        return ConciergeTableViewAdapter(tableView: self.tableView)
    }()
    
    lazy var orderButton: UIButton =
    {
        var frame = CGRectZero
        frame.size.width = self.tableView.bounds.width
        frame.size.height = 75
        
        let orderButton = UIButton(frame: frame)
        let orderTitle = NSLocalizedString("order_nav", comment: "Title for Order Button")
        
        orderButton.backgroundColor = UIColor.blueColor()
        orderButton.setTitle(orderTitle, forState: .Normal)
        
        orderButton.addTarget(self, action: "didOrder:", forControlEvents: .TouchUpInside)
        
        return orderButton
    }()
    
    lazy var tableView: UITableView =
    {
        return UITableView(frame: self.view.bounds)
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("concierge_nav", comment:"Title for ConciergeViewController")
        
        tableView.allowsMultipleSelection = true
        tableView.tableFooterView = orderButton
        
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
    
    func didOrder(sender: AnyObject?)
    {
        let alertViewController = UIAlertController(title: "Order Sent", message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default)
        {
            action in
            
            alertViewController.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertViewController.addAction(okAction)
        presentViewController(alertViewController, animated: true, completion:nil)
    }
}

extension ConciergeViewController: ConciergeTableViewAdapterDelegate
{
}