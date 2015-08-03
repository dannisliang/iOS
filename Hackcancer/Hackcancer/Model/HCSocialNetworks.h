//
//  HCSocialNetworks.h
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCSocialNetworks : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *socialNetworkIcon;
@property (nonatomic, strong) NSString *socialNetworkTitle;
@property (nonatomic, strong) NSString *socialNetworkAddress;


+ (NSString *)parseClassName;

@end
