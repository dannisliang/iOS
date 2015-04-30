//
//  ConciergeStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class ConciergeStore:NSObject, Store
{
    class Item: StoreItem
    {
        private(set) var name: String?
        private(set) var descriptionText: String?
        
        override class func resourceName() -> String
        {
            return "concierge_item"
        }
        
        private override init()
        {
        }
    }
    
    override init()
    {
        for i in 1...4
        {
            let item = Item()
            
            item.name = "New Item"
            item.descriptionText = "Description"
            
            source?.store(item)
        }
    }
    
    func fetchAllItems() -> SignalProducer<Array<Item>?, NSError>?
    {
        return source?.fetchAll()
    }

    private
    
    var source: StoreSource<Item>?
}