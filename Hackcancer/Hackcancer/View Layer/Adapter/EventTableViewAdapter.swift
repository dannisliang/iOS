//
//  EventTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

let Identifier = "cell"

class EventTableViewAdapter: NSObject
{
    var tableView: UITableView?
    
    override init()
    {
        events = [Event]()
    }
    
    func set(events: [Event], animated: Bool = true)
    {
        CATransaction.begin()
        tableView?.beginUpdates()
        
        if (animated == false)
        {
            CATransaction.setAnimationDuration(0)
        }

        let indexPathsToDelete = self.events.filter
        {
            (object: Event!) -> Bool in
                return !contains(events, object)
        }.map
        {
            return NSIndexPath(forRow: $0.index, inSection: 0)
        }
        
        let indexPathsToInsert = events.filter
        {
            (object: Event!) -> Bool in
                return !contains(self.events, object)
        }.map
        {
            return NSIndexPath(forRow: $0.index, inSection: 0)
        }
        
        tableView?.deleteRowsAtIndexPaths(indexPathsToDelete, withRowAnimation: .Automatic)
        tableView?.insertRowsAtIndexPaths(indexPathsToInsert, withRowAnimation: .Automatic)
        
        self.events = events
        
        tableView?.endUpdates()
        CATransaction.commit()
    }
    
    private
    
    var events: [Event]
}

extension EventTableViewAdapter: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(Identifier) as UITableViewCell?
        
        if (cell == nil)
        {
            cell = UITableViewCell(style:.Default,
                                   reuseIdentifier: Identifier)
        }
        
        cell?.textLabel?.text = "Event"
        
        return cell!
    }
}

extension EventTableViewAdapter: UITableViewDelegate
{
    
}