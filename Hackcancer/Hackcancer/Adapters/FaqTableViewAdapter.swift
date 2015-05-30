//
//  FaqTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

protocol FaqTableViewAdapterDelegate
{
    func adapter(adapter: FaqTableViewAdapter, didSelectItem item: FaqItem)
}

class FaqTableViewAdapter: NSObject
{
    var delegate: FaqTableViewAdapterDelegate?
    
    private(set) var tableView: UITableView?
    private(set) var items: Array<FaqItem>?
    
    lazy var store: FaqItemStore =
    {
        return FaqItemStore()
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
                
            self.items = response.result as! Array<FaqItem>?
            self.tableView?.reloadData()
        }
    }
}

extension FaqTableViewAdapter: UITableViewDataSource
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
        cell.textLabel?.text = item?.question
        
        return cell;
    }
}

extension FaqTableViewAdapter: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let item = items![indexPath.row]
        
        delegate?.adapter(self, didSelectItem: item)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}