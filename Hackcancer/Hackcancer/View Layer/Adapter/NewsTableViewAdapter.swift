//
//  NewsTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import ReactiveCocoa
import UIKit

class NewsTableViewAdapter: NSObject
{
    static let Identifier = "cell"
    
    var selectionAction: Action<NewsStore.Item, NewsStore.Item, NoError>?
    var tableView: UITableView?
    
    func setItems(items: Array<NewsStore.Item>, animated: Bool = true)
    {
        CATransaction.begin()
        tableView?.beginUpdates()
        
        if (animated == false)
        {
            CATransaction.setAnimationDuration(0)
        }
        
        let indexPathsToDelete = self.items.filter
        {
            (object: NewsStore.Item!) -> Bool in
            return !contains(items, object)
        }.map
        {
            return NSIndexPath(forRow: $0.index, inSection: 0)
        }
        
        let indexPathsToInsert = items.filter
        {
            (object: NewsStore.Item!) -> Bool in
            return !contains(self.items, object)
        }.map
        {
            return NSIndexPath(forRow: $0.index, inSection: 0)
        }
        
        tableView?.deleteRowsAtIndexPaths(indexPathsToDelete, withRowAnimation: .Automatic)
        tableView?.insertRowsAtIndexPaths(indexPathsToInsert, withRowAnimation: .Automatic)
        
        self.items = items
        
        tableView?.endUpdates()
        CATransaction.commit()
    }
    
    private
    
    var items = Array<NewsStore.Item>()
}

extension NewsTableViewAdapter: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView(tableView, eventCellForRowAtIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = "\(item.name!) - \(item.timeText!)"
        cell.detailTextLabel?.text = item.descriptionText
        
        return cell
    }
    
    func tableView(tableView: UITableView, eventCellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(NewsTableViewAdapter.Identifier) as! UITableViewCell?
        
        if (cell == nil)
        {
            cell = UITableViewCell(style:.Subtitle, reuseIdentifier: NewsTableViewAdapter.Identifier)
        }
        
        return cell!
    }
}

extension NewsTableViewAdapter: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let item = items[indexPath.row]
        
        let signalProducer = selectionAction?.apply(item)
        signalProducer?.start(error: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}