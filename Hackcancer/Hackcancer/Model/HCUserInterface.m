//
//  HCUserInterface.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCUserInterface.h"

@implementation HCUserInterface

@dynamic newsTabBarItem;
@dynamic aboutTabBarItem;
@dynamic conciergeTabBarItem;
@dynamic scheduleTabBarItem;
@dynamic faqTabBarItem;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"NewsArticle";
}

@end
