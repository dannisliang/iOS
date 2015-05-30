//
//  FaqItemStore.swift
//  Hackcancer
//
//  Created by James Campbell on 30/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class FaqItemStore: NSObject
{
    var session = APIClient()
    
    func fetchAllItems() -> RACSignal
    {
        return session.rac_GET("faq_items", parameters:nil)
    }
}