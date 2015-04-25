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
    
    lazy var eventTableViewAdapter: ScheduleTableViewAdapter =
    {
        let adapter = ScheduleTableViewAdapter()
        return adapter
    }()
    
    lazy var scheduleStore: ScheduleStore =
    {
        return ScheduleStore()
    }()
    
    override init()
    {
        super.init()
        
        self.title = NSLocalizedString("schedule_nav", comment: "")
        self.navigationItem.leftBarButtonItem = addBarButtonItem
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
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
        eventTableViewAdapter.setItems(scheduleStore.allItems(), animated:false)
        
        eventTableViewAdapter.selectionCommand = RACCommand(signalBlock:
        {
            let viewController = ScheduleItemViewController(item:$0 as ScheduleStore.Item)
            self.navigationController?.pushViewController(viewController, animated: true)
            return RACSignal.empty()
        });
        
        scheduleStore.changeSignal.subscribeNext
        {
            (next: AnyObject!) -> () in
                self.eventTableViewAdapter.setItems(self.scheduleStore.allItems())
        }
    }
    
    func didPressAdd(sender: AnyObject)
    {
        AddScheduleItemAction.fire()
    }
}