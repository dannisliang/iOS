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
    var adapter: ConciergeTableViewAdapter?
    @IBOutlet var tableView: UITableView?
    
    lazy var orderButton: UIButton =
    {
        var frame = CGRectZero
        frame.size.width = self.tableView?.bounds.width ?? 0
        frame.size.height = 75
        
        let orderButton = UIButton(frame: frame)
        let orderTitle = NSLocalizedString("order_nav", comment: "Title for Order Button")
        
        orderButton.backgroundColor = UIColor.blueColor()
        orderButton.setTitle(orderTitle, forState: .Normal)
        
        orderButton.addTarget(self, action: "didOrder:", forControlEvents: .TouchUpInside)
        
        return orderButton
    }()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("concierge_nav", comment:"Title for ConciergeViewController")
        
        tableView?.allowsMultipleSelection = true
        tableView?.tableFooterView = orderButton
        
        if let tableView = self.tableView
        {
            adapter = ConciergeTableViewAdapter(tableView: tableView)
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