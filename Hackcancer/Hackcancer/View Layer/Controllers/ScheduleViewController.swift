//
//  ScheduleViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import ReactiveCocoa
import UIKit


class ScheduleViewController: UIViewController
{
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
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.title = NSLocalizedString("schedule_nav", comment: "")
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
        tableView.dataSource = eventTableViewAdapter
        tableView.delegate = eventTableViewAdapter
        
        eventTableViewAdapter.tableView = tableView
        eventTableViewAdapter.setItems(scheduleStore.allItems(), animated:false)

        eventTableViewAdapter.selectionAction = Action
        {
            item in
            
            return SignalProducer
            {
                observer, disposable in
                    let viewController = ScheduleItemViewController(item:item)
                    self.navigationController?.pushViewController(viewController, animated: true)
                    sendCompleted(observer)
            }
        }
    }
}