//
//  ConciergeTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 31/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

protocol ConciergeTableViewAdapterDelegate
{
}

class ConciergeTableViewAdapter: NSObject
{
    var delegate: ConciergeTableViewAdapterDelegate?
    
    private(set) var tableView: UITableView?
    private(set) var items: Array<ConciergeItem>?
    
    lazy var store: ConciergeItemStore =
    {
        return ConciergeItemStore()
    }()
    
    init(tableView: UITableView)
    {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier())
    
        self.tableView = tableView
        
        let getSignal = store.fetchAllItems()
        getSignal.subscribeNext
        {
            response in
            
            self.items = response.result as! Array<ConciergeItem>?
            self.tableView?.reloadData()
        }
    }
}

extension ConciergeTableViewAdapter: UITableViewDataSource
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
        let cell: TableViewCell = tableView.dequeueReusableCellWithIdentifier(TableViewCell.identifier(), forIndexPath: indexPath) as! TableViewCell
        let item = items?[indexPath.row]

        cell.textLabel?.text = item?.title
        
        return cell;
    }
}

extension ConciergeTableViewAdapter: UITableViewDelegate
{
}