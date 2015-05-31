//
//  ScheduleTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

protocol ScheduleTableViewAdapterDelegate
{
}

class ScheduleTableViewAdapter: NSObject
{
    var delegate: ScheduleTableViewAdapterDelegate?
    
    private(set) var tableView: UITableView?
    private(set) var items: Array<ScheduleItem>?
    
    lazy var store: ScheduleItemStore =
    {
        return ScheduleItemStore()
    }()
    
    init(tableView: UITableView)
    {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(ScheduleItemTableViewCell.self, forCellReuseIdentifier: ScheduleItemTableViewCell.identifier())
        
        self.tableView = tableView
        
        let getSignal = store.fetchAllItems()
        getSignal.subscribeNext
        {
                response in
                
                self.items = response.result as! Array<ScheduleItem>?
                self.tableView?.reloadData()
        }
    }
}

extension ScheduleTableViewAdapter: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: ScheduleItemTableViewCell = tableView.dequeueReusableCellWithIdentifier(ScheduleItemTableViewCell.identifier(), forIndexPath: indexPath) as! ScheduleItemTableViewCell
        
        let item = items?[indexPath.row]
        cell.item = item
        
        return cell;
    }
}

extension ScheduleTableViewAdapter: UITableViewDelegate
{
}