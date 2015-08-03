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

@property (nonatomic, strong) NSArray *userInterface;
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
//    PFQuery *userInterfaceQuery = [PFQuery queryWithClassName:[HCUserInterface parseClassName]];
//    self.userInterface = [userInterfaceQuery findObjects];
//
//    HCUserInterface *userInterface = self.userInterface.firstObject;
//    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:[userInterface.primaryR floatValue] green:[userInterface.primaryG floatValue] blue:[userInterface.primaryB floatValue] alpha:1.0]];
    
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:102.f green:51.f blue:53.f alpha:1.0]];
    
    [[self.tabBar.items objectAtIndex:0] setTitle:@"News"];
    [[self.tabBar.items objectAtIndex:1] setTitle:@"About"];
    [[self.tabBar.items objectAtIndex:2] setTitle:@"Schedule"];
    [[self.tabBar.items objectAtIndex:3] setTitle:@"FAQs"];

    
//  [[self.tabBar.items objectAtIndex:0] setImage:tabBarItem2];
//  [[self.tabBar.items objectAtIndex:1] setImage:tabBarItem3];
//  [[self.tabBar.items objectAtIndex:2] setImage:tabBarItem4];
//  [[self.tabBar.items objectAtIndex:3] setImage:tabBarItem5];
    
}
@end
