//
//  HCSessionTask.swift
//  Hackcancer
//
//  Created by James Campbell on 29/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation

extension HCSession
{
    class Task : NSObject
    {
        internal init(task: NSURLSessionTask)
        {
            self.task = task
        }
        
        func resume()
        {
            task.resume()
        }
        
        private
        
        let task: NSURLSessionTask
    }
    
    /*
    * A DataTask does not provide any additional
    * functionality over a Task and its presence is merely
    * to provide lexical differentiation from download and upload tasks.
    */
    typealias DataTask = Task
    
    class UploadTask: Task
    {
    }
    
    class DownloadTask: Task
    {
    }
}