//
//  HCUserInterface.h
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCUserInterface : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *newsTabBarItem;
@property (nonatomic, strong) PFFile *aboutTabBarItem;
@property (nonatomic, strong) PFFile *conciergeTabBarItem;
@property (nonatomic, strong) PFFile *scheduleTabBarItem;
@property (nonatomic, strong) PFFile *faqTabBarItem;

+ (NSString *)parseClassName;

@end
