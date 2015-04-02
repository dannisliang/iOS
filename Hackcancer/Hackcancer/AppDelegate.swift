//
//  AppDelegate.swift
//  Hackcancer
//
//  Created by James Campbell on 30/03/2015.
//  Copyright (c) 2015 HC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var rootViewController: RootViewController =
    {
       return RootViewController()
    }()
    
    lazy var window: UIWindow =
    {
       return UIWindow(frame: UIScreen.mainScreen().bounds)
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        return true
    }
}

