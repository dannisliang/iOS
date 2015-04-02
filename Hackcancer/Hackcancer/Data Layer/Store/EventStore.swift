//
//  EventStore.swift
//  Hackcancer
//
//  Created by James Campbell on 02/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class EventStore
{
    var changeSignal: RACSignal
    {
        return changeSubject
    }
    
    private var changeSubject: RACSubject
        {
            return RACSubject()
    }
    
    func allEvents() -> [Event]
    {
        return []
    }
    
    private
    
    func emitChange()
    {
        changeSubject.sendNil()
    }
}