//
//  HCSession.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class HCSession: NSObject
{
    class func defaultSession() -> HCSession
    {
        return HCSession()
    }
    
    init(configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration())
    {
        session = NSURLSession(configuration: configuration)
    }
    
    private
    
    let session: NSURLSession
}