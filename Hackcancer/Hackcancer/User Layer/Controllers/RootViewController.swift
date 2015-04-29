//
//  RootViewController.swift
//  Hackcancer
//
//  Created by James Campbell on 30/03/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController
{
    lazy var newsNavigationViewController: UINavigationController =
    {
        return UINavigationController(rootViewController: NewsViewController())
    }()
    
    lazy var aboutNavigationViewController: UINavigationController =
    {
        return UINavigationController(rootViewController: AboutViewController())
    }()
    
    lazy var conciergeNavigationViewController: UINavigationController =
    {
        return UINavigationController(rootViewController: ConciergeViewController())
    }()
    
    lazy var scheduleNavigationViewController: UINavigationController =
    {
        return UINavigationController(rootViewController: ScheduleViewController())
    }()
    
    lazy var faqNavigationViewController: UINavigationController =
    {
        return UINavigationController(rootViewController: FAQViewController())
    }()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        self.viewControllers =
        [
            newsNavigationViewController,
            aboutNavigationViewController,
            conciergeNavigationViewController,
            scheduleNavigationViewController,
            faqNavigationViewController
        ]
    }
}

