//
//  AddEventAction.swift
//  Hackcancer
//
//  Created by James Campbell on 03/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

private let SharedAddEventAction = AddEventAction()

class AddEventAction
{
    let addEventSubject: RACSubject = RACSubject()
    
    class func shared() -> AddEventAction
    {
        return SharedAddEventAction
    }
    
    func addEvent() -> Void
    {
        addEventSubject.sendNil()
    }
}