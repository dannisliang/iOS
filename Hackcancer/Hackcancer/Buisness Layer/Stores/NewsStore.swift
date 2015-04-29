//
//  NewsStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

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
        source = MemoryStoreSource<Item>()
        
        for i in 1...4
        {
            let item = Item()
            let timeText = "18:00"
            
            item.name = "New Item"
            item.time = self.timeFormatter.dateFromString(timeText)
            item.timeText = timeText
            item.descriptionText = "Description"
            
            source.store(item)
        }
    }
    
    func fetchAllItems() -> SignalProducer<Array<Item>?, NSError>?
    {
        return source.fetchAll()
    }
    
    private
    
    lazy var timeFormatter: NSDateFormatter =
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    private
    
    let source: StoreSource<Item>
}