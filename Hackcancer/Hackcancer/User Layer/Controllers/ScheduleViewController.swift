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
    
    lazy var scheduleTableViewAdapter: ScheduleTableViewAdapter =
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
        tableView.dataSource = scheduleTableViewAdapter
        tableView.delegate = scheduleTableViewAdapter
        
        scheduleTableViewAdapter.tableView = tableView
        scheduleStore.fetchAllItems()?.start(next:
        {
            if let items = $0
            {
                self.scheduleTableViewAdapter.setItems(items, animated:false)
            }
        })
        
        scheduleTableViewAdapter.selectionAction = Action
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