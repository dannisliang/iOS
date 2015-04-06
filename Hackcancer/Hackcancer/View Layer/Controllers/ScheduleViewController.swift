//
//  ScheduleViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController
{
    lazy var addBarButtonItem: UIBarButtonItem =
    {
        let item = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "didPressAdd:")
        return item
    }()
    
    lazy var tableView: UITableView =
    {
        let tableView = UITableView(frame: UIScreen.mainScreen().bounds)
        return tableView
    }()
    
    lazy var eventTableViewAdapter: EventTableViewAdapter =
    {
        let adapter = EventTableViewAdapter()
        return adapter
    }()
    
    lazy var eventStore: EventStore =
    {
        return EventStore()
    }()
    
    override init()
    {
        super.init()
        
        self.title = NSLocalizedString("schedule_nav",
                                        comment: "")
        self.navigationItem.leftBarButtonItem = addBarButtonItem
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil,
            bundle: nibBundleOrNil)
    }
    
    override func loadView()
    {
        view = tableView
    }
    
    override func viewDidLoad()
    {
        tableView.dataSource = eventTableViewAdapter
        tableView.delegate = eventTableViewAdapter
        
        eventTableViewAdapter.tableView = tableView
        eventTableViewAdapter.set(eventStore.allEvents(), animated:false)
        
        eventStore.changeSignal.subscribeNext
        {
            (next: AnyObject!) -> () in
                self.eventTableViewAdapter.set(self.eventStore.allEvents())
        }
    }
    
    func didPressAdd(sender: AnyObject)
    {
        AddEventAction.shared().addEvent()
    }
}