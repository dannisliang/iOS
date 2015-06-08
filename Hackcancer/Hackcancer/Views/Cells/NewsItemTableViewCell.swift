//
//  NewsItemTableViewCell.swift
//  Hackcancer
//
//  Created by James Campbell on 28/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class NewsItemTableViewCell: TableViewCell
{
    var item: NewsItem?
    {
        didSet
        {
            textLabel?.text = item?.title
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        textLabel?.frame = bounds
        textLabel?.textAlignment = .Center
    }
}