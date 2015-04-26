//
//  NewsItemViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 26/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import UIKit

class NewsItemViewController: UIViewController
{
    lazy var descriptionLabel: UILabel =
    {
        return UILabel(frame: self.view.bounds)
    }()
    
    let item: NewsStore.Item
    
    init(item: NewsStore.Item)
    {
        self.item = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
        self.item = aDecoder.decodeObjectForKey("item") as! NewsStore.Item
        
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = item.name
        self.descriptionLabel.text = item.descriptionText
    }
    
    override func loadView()
    {
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad()
    {
        view.addSubview(self.descriptionLabel)
    }
}