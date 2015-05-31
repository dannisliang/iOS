//
//  RootViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 26/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController
{
    init()
    {
        super.init(nibName: nil, bundle: nil)
        
        viewControllers =
        [
            NewsViewController(),
            AboutViewController(),
            ScheduleViewController(),
            ConciergeViewController(),
            FaqViewController()
        ]
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

