//
//  HCTabBarViewController.m
//  Hackcancer
//
//  Created by Swift, Robert on 01/08/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCTabBarViewController.h"

#import "HCUserInterface.h"

@interface HCTabBarViewController ()

@property (nonatomic, strong) HCUserInterface *userInterface;
@property (nonatomic, strong) UIImage *tabBarItem0;

@end

@implementation HCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self.userInterface.newsTabBarItem getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        if (!error) {
//            self.tabBarItem0 = [UIImage imageWithData:data];
//        }
//    }];
    
//    [[self.tabBarController.tabBar.items objectAtIndex:0] setImage:self.tabBarItem0];
    
//    [UITabBar appearance].tintColor = [UIColor colorWithRed:255 green:200 blue:50 alpha:1.0];
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:255 green:200 blue:50 alpha:1.0]];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:255 green:200 blue:50 alpha:1.0]];
    
    
//    [UITabBar appearance].tintColor = self.colors[@"Tint2"];
//    
//    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];

    
//    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:[self.userInterface.primaryR floatValue] green:[self.userInterface.primaryG floatValue] blue:[self.userInterface.primaryB floatValue] alpha:1.0]];
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:[self.userInterface.primaryR floatValue] green:[self.userInterface.primaryG floatValue] blue:[self.userInterface.primaryB floatValue] alpha:1.0]];
//    
    
//    [[self.tabBarController.tabBar.items objectAtIndex:1] setImage:tabBarItem2];
//    [[self.tabBarController.tabBar.items objectAtIndex:2] setImage:tabBarItem3];
//    [[self.tabBarController.tabBar.items objectAtIndex:3] setImage:tabBarItem4];
//    [[self.tabBarController.tabBar.items objectAtIndex:4] setImage:tabBarItem5];
}


@end
