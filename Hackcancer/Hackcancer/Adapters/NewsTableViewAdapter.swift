//
//  NewsTableViewAdapter.swift
//  Hackcancer
//
//  Created by James Campbell on 27/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

protocol NewsTableViewAdapterDelegate
{
    func adapter(adapter: NewsTableViewAdapter, didSelectItem item: NewsItem)
}

class NewsTableViewAdapter: NSObject
{
    var delegate: NewsTableViewAdapterDelegate?
    
    private(set) var tableView: UITableView?
    private(set) var items: Array<NewsItem>?
    
    lazy var store: NewsItemStore =
    {
        return NewsItemStore()
    }()
    
    init(tableView: UITableView)
    {
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let newsTableViewCellNib = UINib(nibName: "NewsItemTableViewCell", bundle: nil);
        tableView.registerNib(newsTableViewCellNib, forCellReuseIdentifier: NewsItemTableViewCell.identifier())
        
        self.tableView = tableView
        
        let getSignal = store.fetchAllItems()

        getSignal.subscribeNext
        {
            response in
            
            self.items = response.result as! Array<NewsItem>?
            self.tableView?.reloadData()
        }
    }
}

extension NewsTableViewAdapter: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: NewsItemTableViewCell = tableView.dequeueReusableCellWithIdentifier(NewsItemTableViewCell.identifier(), forIndexPath: indexPath) as! NewsItemTableViewCell
        
        let item = items?[indexPath.row]
        cell.item = item
        
        return cell;
    }
}

extension NewsTableViewAdapter: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let item = items![indexPath.row]
        
        delegate?.adapter(self, didSelectItem: item)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 200
    }
}