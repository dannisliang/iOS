//
//  MemoryStoreSource.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class MemoryStoreSource<T>: StoreSource<T>
{
    override func store(item: T) -> Void
    {
        items.append(item)
    }
    
    override func fetchAll() -> SignalProducer<Array<T>?, NSError>?
    {
        let producer = SignalProducer<Array<T>?, NSError>()
        {
            observer, disposable in
                sendNext(observer, self.items)
                return
        }
        
        return producer
    }
    
    private
        var items = Array<T>()
}