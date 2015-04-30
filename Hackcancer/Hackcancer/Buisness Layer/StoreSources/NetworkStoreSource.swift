//
//  NetworkStoreSource.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import ReactiveCocoa

class NetworkStoreSource<T where T: StoreItem>: StoreSource<T>
{
    override convenience init()
    {
        self.init(configuration: nil)
    }
    
    init(configuration: NetworkStoreSourceConfiguration?)
    {
        self.configuration = configuration
    }
    
    override func store(item: T) -> Void
    {
    }
    
    override func fetchAll() -> SignalProducer<Array<T>?, NSError>?
    {
        let producer = SignalProducer<Array<T>?, NSError>()
        {
            observer, disposable in
            
                let url = self.configuration!.baseURI?.URLByAppendingPathComponent(T.collectionName())
                let request = NSURLRequest(URL: url!)
                let task = self.session.makeTaskForRequest(request, type: .Data)
                task.resume()
            
                return
        }
        return producer
    }
    
    private
    
    let configuration: NetworkStoreSourceConfiguration?
    let session = HCSession.sharedSession()
}

class NetworkStoreSourceConfiguration
{
    var baseURI: NSURL?
    
    init()
    {
        
    }
}