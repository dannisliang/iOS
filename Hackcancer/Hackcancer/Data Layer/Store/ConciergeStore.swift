//
//  ConciergeStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class ConciergeStore
{
    class Item: NSObject
    {
        private(set) var name: String?
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
            
            item.name = "New Item"
            item.descriptionText = "Description"
            
            self.items.append(item)
        }
    }
    
    func allItems() -> Array<Item>
    {
        return items
    }
    
    private
    
    var items: Array<Item> = []
}