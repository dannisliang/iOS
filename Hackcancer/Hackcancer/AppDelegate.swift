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
}

