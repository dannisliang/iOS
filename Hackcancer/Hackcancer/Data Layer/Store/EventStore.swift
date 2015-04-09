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
    class Event: NSObject
    {
        let fields: Fields
        
        struct Fields
        {
            var name: String?
            var description: String?
            
            init()
            {
                
            }
        }
        
        private init(_ fields: Fields)
        {
            self.fields = fields
        }
    }
    
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

    func allEvents() -> Array<Event>
    {
        return events
    }
    
    private
    
    lazy var changeSubject: RACSubject =
    {
        return RACSubject()
    }()
    
    var events: Array<Event> = []
    
    func addEvent()
    {
        var fields: Event.Fields = Event.Fields()
        fields.name = "New Event"
        
        let event = Event(fields)

        events.append(event)
        self.emitChange()
    }
    
    func emitChange()
    {
        changeSubject.sendNil()
    }
}