//
//  FAQStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class FAQStore: Store
{
    class Item: StoreItem
    {
        private(set) var question: String?
        private(set) var answer: String?
        
        override class func resourceName() -> String
        {
            return "faq_item"
        }
        
        private override init()
        {
        }
    }
    
    override init()
    {
        super.init()
        
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
    
    let source: StoreSource<Item> = NetworkStoreSource<Item>(baseURI: ApplicationAssembly.apiBaseURI!)
}