//
//  HCURLRequest.swift
//  Hackcancer
//
//  Created by James Campbell on 03/05/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class HCURLRequest: NSURLRequest
{
    var parameters: Dictionary<String, AnyObject>?
    var parser: protocol<HCParser>?
    var requestSerializer: protocol<HCURLSessionRequestSerializer>?
    var responseDeserializer: protocol<HCURLSessionResponseSerializer>?
}