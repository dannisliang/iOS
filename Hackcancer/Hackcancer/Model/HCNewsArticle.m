//
//  HCNewsArticle.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCNewsArticle.h"

@implementation HCNewsArticle

@dynamic image;
@dynamic title;
@dynamic content;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"NewsArticle";
}

@end
