//
//  APIClient.swift
//  Hackcancer
//
//  Created by James Campbell on 27/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

class APIClient: OVCHTTPSessionManager
{
    init()
    {
        let baseURL = NSURL(string: API_ENDPOINT)
        
        super.init(baseURL: baseURL, sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        self.requestSerializer = AFJSONRequestSerializer()
        self.responseSerializer = AFJSONResponseSerializer()
    }

    required init(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init!(baseURL url: NSURL!, managedObjectContext context: NSManagedObjectContext!, sessionConfiguration configuration: NSURLSessionConfiguration!)
    {
        super.init(baseURL: url, managedObjectContext: context, sessionConfiguration: configuration);
        
        APIClient.modelClassesByResourcePath()
    }
    
    override class func modelClassesByResourcePath() -> Dictionary<NSObject, AnyObject>!
    {
        return [
            "news_items/": NewsFeed.classForCoder(),
            "news_items/*": NewsItem.classForCoder()
        ]
    }
}