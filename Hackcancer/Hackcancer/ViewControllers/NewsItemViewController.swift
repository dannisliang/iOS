//
//  NewsItemViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 28/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import Foundation

class NewsItemViewController: UIViewController
{
    private(set) var item: NewsItem?
    
    lazy var contentTextView: UITextView =
    {
        let contentTextView = UITextView(frame: self.view.bounds)
        return contentTextView
    }()
    
    init(item: NewsItem)
    {
        super.init(nibName: nil, bundle: nil)
        
        navigationItem.title = item.title

        contentTextView.text = item.content
        view.addSubview(contentTextView)
        
        self.item = item
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}