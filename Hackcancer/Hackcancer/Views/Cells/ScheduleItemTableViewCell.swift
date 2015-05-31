//
//  ScheduleItemTableViewCell.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ScheduleItemTableViewCell: TableViewCell
{
    lazy var timeFormatter: NSDateFormatter =
    {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH"
        
        return dateFormatter
    }()
    
    var item: ScheduleItem?
    {
        didSet
        {
            textLabel?.text = "9:00 \(item!.title!)"
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}