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
    let baseURI: NSURL
    
    init(baseURI: NSURL)
    {
        self.baseURI = baseURI
    }
    
    override func store(item: T) -> Void
    {
    }
    
    override func fetchAll() -> SignalProducer<Array<T>?, NSError>?
    {
        let producer = SignalProducer<Array<T>?, NSError>()
        {
            observer, disposable in
            
                let url = self.baseURI.URLByAppendingPathComponent(T.collectionName())
                let request = NSURLRequest(URL: url)
                let task = self.session.makeTaskForRequest(request, type: .Data)
                task.resume()
            
                return
        }
        
        return producer
    }
    
    private
    
    let session = HCURLSession.sharedSession()
}