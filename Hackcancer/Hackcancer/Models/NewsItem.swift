//
//  NewsItem.swift
//  Hackcancer
//
//  Created by James Campbell on 27/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class NewsItem: MTLModel
{
    private(set) var title: String?
    
    class func JSONKeyPathsByPropertyKey() -> Dictionary<NSObject, AnyObject>!
    {
        return [
            "title": "title"
        ]
    }
}