//
//  HCSocialNetworks.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCSocialNetworks.h"

@implementation HCSocialNetworks

@dynamic socialNetworkIcon;
@dynamic socialNetworkTitle;
@dynamic socialNetworkAddress;

+ (void)load
{
    [self registerSubclass];
}

+ (NSString *)parseClassName
{
    return @"SocialNetworks";
}

@end
