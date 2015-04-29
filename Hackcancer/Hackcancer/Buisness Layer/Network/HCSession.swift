//
//  HCSession.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

class HCSession: NSObject
{
    enum TaskType
    {
        case Data
        case Download
        case Upload
        
        func createTask(request: NSURLRequest, session: NSURLSession) -> Task
        {
            let underlyingTask = createUnderlyingTask(request, session: session)
            let task = Task(task: underlyingTask)
            return task
        }
        
        private
        
        func createUnderlyingTask(request: NSURLRequest, session: NSURLSession) -> NSURLSessionTask
        {
            switch(self)
            {
            case .Data:
                return session.dataTaskWithRequest(request)
            case .Download:
                return session.downloadTaskWithRequest(request)
            case .Upload:
                return session.uploadTaskWithRequest(request, fromData: nil)
            }
        }
    }
    
    class func defaultSession() -> HCSession
    {
        return HCSession()
    }
    
    init(configuration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration())
    {
        session = NSURLSession(configuration: configuration)
    }
    
    func makeTaskForRequest(request: NSURLRequest, type: TaskType = .Data) -> Task
    {
        return type.createTask(request, session: session)
    }
    
    private
    
    let session: NSURLSession
}