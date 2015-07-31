//
//  HCScheduleItem.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCScheduleItem.h"

@implementation HCScheduleItem

@dynamic image;
@dynamic title;
@dynamic content;
@dynamic time;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"ScheduleItem";
}

@end
