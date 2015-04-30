//
//  FAQStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class FAQStore: NSObject, Store
{
    class Item: StoreItem
    {
        private(set) var question: String?
        private(set) var answer: String?
        
        private override init()
        {
        }
    }
    
    override init()
    {
        for i in 1...4
        {
            let item = Item()
            
            item.question = "Question ?"
            item.answer = "Answer"
            
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