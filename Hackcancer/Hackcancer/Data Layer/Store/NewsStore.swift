//
//  NewsStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class NewsStore
{
    class Item: NSObject
    {
        private(set) var name: String?
        private(set) var time: NSDate?
        private(set) var timeText: String?
        private(set) var descriptionText: String?
        
        private override init()
        {
        }
    }
    
    init()
    {
        for i in 1...4
        {
            let item = Item()
            let timeText = "18:00"
            
            item.name = "New Item"
            item.time = self.timeFormatter.dateFromString(timeText)
            item.timeText = timeText
            item.descriptionText = "Description"
            
            self.items.append(item)
        }
    }
    
    func allItems() -> Array<Item>
    {
        return items
    }
    
    private
    
    lazy var timeFormatter: NSDateFormatter =
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var items: Array<Item> = []
}