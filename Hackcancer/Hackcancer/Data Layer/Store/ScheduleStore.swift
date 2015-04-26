//
//  ScheduleStore.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class ScheduleStore
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
    }

    func allItems() -> Array<Item>
    {
        return items
    }
    
    func addItem() -> Signal<Item, NoError>
    {
        let (signal, observer) = Signal<Item, NoError>.pipe()
        
        let item = Item()
        let timeText = "18:00"
        
        item.name = "New Item"
        item.time = self.timeFormatter.dateFromString(timeText)
        item.timeText = timeText
        item.descriptionText = "Description"
        
        self.items.append(item)
        
        sendCompleted(observer)
        
        return signal
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