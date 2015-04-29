//
//  FAQStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class FAQStore
{
    class Item: NSObject
    {
        private(set) var question: String?
        private(set) var answer: String?
        
        private override init()
        {
        }
    }
    
    init()
    {
        source = StoreSource<Item>()
        
        for i in 1...4
        {
            let item = Item()
            
            item.question = "Question ?"
            item.answer = "Answer"
            
            source.store(item)
        }
    }
    
    func fetchAllItems() -> SignalProducer<Array<Item>?, NSError>?
    {
        return source.fetchAll()
    }
    
    private
    
    let source: StoreSource<Item>
}