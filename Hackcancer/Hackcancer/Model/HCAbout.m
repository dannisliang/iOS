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
@dynamic eventIcon;
@dynamic eventStartDate;
@dynamic eventEndDate;
@dynamic facebookTitle;
@dynamic twitterTitle;
@dynamic instagramTitle;
@dynamic emailTitle;
@dynamic facebookIcon;
@dynamic twitterIcon;
@dynamic instagramIcon;
@dynamic emailIcon;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"AboutContent";
}

@end
