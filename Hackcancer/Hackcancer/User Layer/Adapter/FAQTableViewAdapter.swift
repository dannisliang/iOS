//
//  FAQTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Cent
import Dollar
import ReactiveCocoa
import UIKit

class FAQTableViewAdapter: NSObject
{
    static let Identifier = "cell"
    
    var selectionAction: Action<FAQStore.Item, FAQStore.Item, NoError>?
    var tableView: UITableView?
    
    func setItems(items: Array<FAQStore.Item>, animated: Bool = true)
    {
        CATransaction.begin()
        tableView?.beginUpdates()
        
        if (animated == false)
        {
            CATransaction.setAnimationDuration(0)
        }
        
        let indexPathsToDelete = self.items.filter
        {
            return !contains(items, $0)
        }.map
        {
            let index = find(self.items, $0)
            return NSIndexPath(forRow: index!, inSection: 0)
            
        } as Array<NSIndexPath>
        
        let indexPathsToInsert = items.filter
        {
            return !contains(self.items, $0)
        }.map
        {
            let index = find(items, $0)
            return NSIndexPath(forRow: index!, inSection: 0)
            
        } as Array<NSIndexPath>
        
        tableView?.deleteRowsAtIndexPaths(indexPathsToDelete, withRowAnimation: .Automatic)
        tableView?.insertRowsAtIndexPaths(indexPathsToInsert, withRowAnimation: .Automatic)
        
        self.items = items
        
        tableView?.endUpdates()
        CATransaction.commit()
    }
    
    private
    
    var items = Array<FAQStore.Item>()
}

extension FAQTableViewAdapter: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView(tableView, eventCellForRowAtIndexPath: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.question
        cell.detailTextLabel?.text = item.answer
        
        return cell
    }
    
    func tableView(tableView: UITableView, eventCellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(FAQTableViewAdapter.Identifier) as! UITableViewCell?
        
        if (cell == nil)
        {
            cell = UITableViewCell(style:.Subtitle, reuseIdentifier: FAQTableViewAdapter.Identifier)
        }
        
        return cell!
    }
}

extension FAQTableViewAdapter: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let item = items[indexPath.row]
        
        let signalProducer = selectionAction?.apply(item)
        signalProducer?.start(error: nil)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}