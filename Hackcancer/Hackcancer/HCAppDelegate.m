//
//  HCAppDelegate.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCAppDelegate.h"

#import <Parse/Parse.h>

@implementation HCAppDelegate

#pragma mark - AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];
    
    [Parse setApplicationId:@"vi58nhOph6gksQfF68c5DCKb3B4U5jV2S2bDgmjb"
                  clientKey:@"9jhXVpRzkKH4mtAFoFvRN9lyASbWwLM0Pv1z97aR"];
    
    return  YES;
}

#pragma mark - Window

- (UIWindow *)window
{
    if (!_window)
    {
        CGRect bounds = [UIScreen mainScreen].bounds;
    
        _window = [[UIWindow alloc] initWithFrame:bounds];
    }
    
    return _window;
}

@end
