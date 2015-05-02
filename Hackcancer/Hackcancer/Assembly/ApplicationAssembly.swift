//
//  ApplicationAssembly.swift
//  Hackcancer
//
//  Created by James Campbell on 02/05/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class ApplicationAssembly
{
    class var conciergeStoreSource: NetworkStoreSource<ConciergeStore.Item>
    {
        let networkConfiguration = NetworkStoreSourceConfiguration()
        networkConfiguration.baseURI = NSURL(string: "http://localhost:3000/")

        return NetworkStoreSource<ConciergeStore.Item>(configuration: networkConfiguration)
    }
}