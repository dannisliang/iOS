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
    var newsItem: NewsItem?
    {
        didSet
        {
            textLabel?.text = newsItem?.title
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
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        textLabel?.frame = bounds
        textLabel?.textAlignment = .Center
    }
}