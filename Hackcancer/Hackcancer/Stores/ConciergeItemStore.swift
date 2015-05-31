//
//  ConciergeItemStore.swift
//  Hackcancer
//
//  Created by James Campbell on 31/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class ConciergeItemStore: NSObject
{
    var session = APIClient()
    
    func fetchAllItems() -> RACSignal
    {
        return session.rac_GET("concierge_items", parameters:nil)
    }
}