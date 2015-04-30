//
//  StoreItem.swift
//  Hackcancer
//
//  Created by James Campbell on 30/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class StoreItem: NSObject
{
    class func resourceName() -> String
    {
        return "store_item"
    }
    
    class func collectionName() -> String
    {
        return "\(resourceName())s"
    }
}