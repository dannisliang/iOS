//
//  ScheduleItemViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 11/04/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import Foundation
import UIKit

class ScheduleItemViewController: UIViewController
{
    let item: ScheduleStore.Item
    
    init(item: ScheduleStore.Item)
    {
        self.item = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder)
    {
       self.item = aDecoder.decodeObjectForKey("item") as! ScheduleStore.Item
        
       super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = item.name
    }
    
    override func loadView()
    {
        view = UIView(frame: UIScreen.mainScreen().bounds)
        view.backgroundColor = UIColor.whiteColor()
    }
}