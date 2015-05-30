//
//  FaqItem.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class FaqItem: MTLModel, MTLJSONSerializing
{
    private(set) var question: String?
    private(set) var answer: String?
    
    class func JSONKeyPathsByPropertyKey() -> Dictionary<NSObject, AnyObject>!
    {
        return [
            "question": "question",
            "answer": "answer"
        ]
    }
}