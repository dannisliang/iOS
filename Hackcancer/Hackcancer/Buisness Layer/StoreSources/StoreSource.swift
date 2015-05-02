//
//  StoreSource.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class StoreSource<T where T:StoreItem>: NSObject
{
    func store(item: T) -> Void
    {
    
    }
    
    func fetchAll() -> SignalProducer<Array<T>?, NSError>?
    {
        return nil
    }
}