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
    
    init()
    {
        AddEventAction.shared().addEventSubject.subscribeNext
        {
            (next: AnyObject!) -> Void in
                self.addEvent()
        }
    }

    func allEvents() -> [Event]
    {
        return events
    }
    
    private
    
    lazy var changeSubject: RACSubject =
    {
        return RACSubject()
    }()
    
    var events: [Event] = []
    
    func addEvent()
    {
        var fields: Event.Fields = Event.Fields()
        fields.name = "New Event"
        fields.date = NSDate()
        
        let event = Event(fields)

        events.append(event)
        self.emitChange()
    }
    
    func emitChange()
    {
        changeSubject.sendNil()
    }
}