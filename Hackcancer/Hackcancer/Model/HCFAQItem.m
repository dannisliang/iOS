//
//  HCFAQItem.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCFAQItem.h"

@implementation HCFAQItem

@dynamic title;
@dynamic question;
@dynamic answer;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"FAQQuestion";
}

@end
