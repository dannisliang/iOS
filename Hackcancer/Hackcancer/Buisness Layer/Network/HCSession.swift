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
            let task:Task
            
            switch(self)
            {
            case .Data:
                let underlyingTask = session.dataTaskWithRequest(request)
                task = DataTask(task:underlyingTask)
            case .Download:
                let underlyingTask = session.downloadTaskWithRequest(request)
                task = DownloadTask(task:underlyingTask)
            case .Upload:
                let underlyingTask = session.uploadTaskWithRequest(request, fromData: nil)
                task = UploadTask(task:underlyingTask)
            }
            
            return task
        }
    }
    
    class func sharedSession() -> HCSession
    {
        return HCSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    }
    
    init(configuration: NSURLSessionConfiguration)
    {
        self.configuration = configuration
        
        super.init()
    }
    
    func makeTaskForRequest(request: NSURLRequest, type: TaskType = .Data) -> Task
    {
        return type.createTask(request, session: session)
    }
    
    private
    
    let configuration: NSURLSessionConfiguration
    let delegateQueue = NSOperationQueue()
    lazy var session: NSURLSession =
    {
       return NSURLSession(configuration: self.configuration, delegate: self, delegateQueue:self.delegateQueue)
    }()
}

extension HCSession: NSURLSessionTaskDelegate
{
    
}