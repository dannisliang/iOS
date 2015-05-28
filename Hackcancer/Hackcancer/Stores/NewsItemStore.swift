//
//  NewsItemStore.swift
//  Hackcancer
//
//  Created by James Campbell on 27/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class NewsItemStore: NSObject
{
    var session = APIClient()
    
    func fetchAllItems()
    {
        let getSignal = session.rac_GET("new_items", parameters:nil)
        
        getSignal.subscribeNext
        {
            response in
            NSLog("Result: \(response.result)")
        }
        
        getSignal.subscribeError
        {
                error in
                NSLog("Result: \(error)")
        }
    }
}