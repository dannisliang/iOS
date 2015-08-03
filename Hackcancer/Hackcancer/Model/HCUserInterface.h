//
//  HCUserInterface.h
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCUserInterface : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *tabBarItem;
@property (nonatomic, strong) NSString *viewTitle;
@property NSNumber *primaryR;
@property NSNumber *primaryG;
@property NSNumber *primaryB;


+ (NSString *)parseClassName;

@end
