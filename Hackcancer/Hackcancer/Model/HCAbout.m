//
//  HCAbout.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCAbout.h"

@implementation HCAbout

@dynamic hackLocation;
@dynamic title;
@dynamic aboutDescription;
@dynamic eventStartDate;
@dynamic eventEndDate;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"AboutContent";
}

@end
