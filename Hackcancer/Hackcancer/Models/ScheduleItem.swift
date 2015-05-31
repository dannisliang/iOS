//
//  ScheduleItem.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ScheduleItem: MTLModel, MTLJSONSerializing
{
    private(set) var title: String?
    private(set) var time: NSDate?
    
    class func JSONKeyPathsByPropertyKey() -> Dictionary<NSObject, AnyObject>!
    {
        return [
            "title": "title",
            "time": "time"
        ]
    }
}