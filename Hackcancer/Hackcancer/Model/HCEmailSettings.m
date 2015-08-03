//
//  HCEmailSettings.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCEmailSettings.h"

@implementation HCEmailSettings

@dynamic emailTitle;
@dynamic emailSubject;
@dynamic emailBody;
@dynamic emailAddress;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"EmailSettings";
}

@end
