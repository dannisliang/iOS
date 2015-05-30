//
//  AppDelegate.swift
//  Hackcancer
//
//  Created by James Campbell on 26/05/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? =
    {
        let frame = UIScreen.mainScreen().bounds
        return UIWindow(frame:frame)
    }()
    
    lazy var navigationViewController: UINavigationController =
    {
        return UINavigationController()
    }()

    lazy var rootViewController: RootViewController =
    {
       return RootViewController()
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        navigationViewController.pushViewController(rootViewController, animated: false)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

