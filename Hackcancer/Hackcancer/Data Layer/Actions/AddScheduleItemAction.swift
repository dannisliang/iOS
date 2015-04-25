//
//  AddScheduleItemAction.swift
//  Hackcancer
//
//  Created by James Campbell on 03/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

private

class AddScheduleItemAction
{
    static let signal: RACSignal = RACSubject()
    
    class func fire() -> Void
    {
        let subject = signal as RACSubject
        subject.sendNil()
    }
}