//
//  NetworkStoreSource.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NetworkStoreSource<T>: StoreSource<T>
{
    override func store(item: T) -> Void
    {
    }
    
    override func fetchAll() -> SignalProducer<Array<T>?, NSError>?
    {
        let producer = SignalProducer<Array<T>?, NSError>()
        {
            observer, disposable in
                return
        }
        return producer
    }
    
    private
    
    let session = HCSession.defaultSession()
}