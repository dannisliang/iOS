//
//  HCFAQItem.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCFAQItem.h"

@implementation HCFAQItem

@dynamic question;
@dynamic answer;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"FAQItem";
}

@end
