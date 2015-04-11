//
//  ScheduleStore.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

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
    
    var changeSignal: RACSignal
    {
        return changeSubject
    }
    
    init()
    {
        AddEventAction.shared().addEventSubject.subscribeNext
        {
            (next: AnyObject!) -> Void in
                self.addEvent()
        }
    }

    func allItems() -> Array<Item>
    {
        return items
    }
    
    private
    
    lazy var changeSubject: RACSubject =
    {
        return RACSubject()
    }()
    
    lazy var timeFormatter: NSDateFormatter =
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var items: Array<Item> = []
    
    func addEvent()
    {
        let item = Item()
        let timeText = "18:00"
        
        item.name = "New Event"
        item.time = timeFormatter.dateFromString(timeText)
        item.timeText = timeText
        item.descriptionText = "Description"

        items.append(item)
        self.emitChange()
    }
    
    func emitChange()
    {
        changeSubject.sendNil()
    }
}