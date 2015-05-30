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
    
    func fetchAllItems() -> RACSignal
    {
        return session.rac_GET("news_items", parameters:nil)
    }
}