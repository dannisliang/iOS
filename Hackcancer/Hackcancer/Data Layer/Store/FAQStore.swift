//
//  FAQStore.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

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
        for i in 1...4
        {
            let item = Item()
            
            item.question = "Question ?"
            item.answer = "Answer"
            
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