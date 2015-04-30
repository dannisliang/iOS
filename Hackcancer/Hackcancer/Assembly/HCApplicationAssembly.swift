//
//  HCApplicationAssembly.swift
//  Hackcancer
//
//  Created by James Campbell on 30/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import Typhoon

class HCApplicationAssembly: TyphoonAssembly
{
    func conciergeStore() -> AnyObject
    {
        //Perform an initializer injection
        
        let sourceDefinition = TyphoonDefinition.withClass(MemoryStoreSource<ConciergeStore.Item>.self)
        return TyphoonDefinition.withClass(ConciergeStore.self)
        {
            definition in
                definition.injectProperty("source", with: sourceDefinition)
        }
    }
}