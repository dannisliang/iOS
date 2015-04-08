//
//  Event.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class Event: NSObject
{
    let fields: Fields
    
    struct Fields
    {
        var name: String?
        var date: NSDate?
        var description: String?
        
        init()
        {
            
        }
    }
    
    init(_ fields: Fields)
    {
        self.fields = fields
    }
}