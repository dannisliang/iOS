//
//  ScheduleViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ScheduleViewController: UIViewController
{
    var adapter: ScheduleTableViewAdapter?
    @IBOutlet var tableView: UITableView?

    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        title = NSLocalizedString("schedule_nav", comment:"Title for ScheduleViewController")
        
        if let tableView = self.tableView
        {
            adapter = ScheduleTableViewAdapter(tableView: tableView)
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

extension ScheduleViewController: ScheduleTableViewAdapterDelegate
{
}