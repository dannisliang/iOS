//
//  EventTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

class EventTableViewAdapter: NSObject
{
    var tableView: UITableView?
}

extension EventTableViewAdapter: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return UITableViewCell(frame: CGRectZero)
    }
}

extension EventTableViewAdapter: UITableViewDelegate
{
    
}