//
//  ConciergeItem.swift
//  Hackcancer
//
//  Created by James Campbell on 31/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ConciergeItem: MTLModel, MTLJSONSerializing
{
    private(set) var id: NSNumber?
    private(set) var title: String?
    
    class func JSONKeyPathsByPropertyKey() -> Dictionary<NSObject, AnyObject>!
    {
        return [
            "id": "id",
            "title": "title"
        ]
    }
}