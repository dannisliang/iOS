//
//  HCScheduleItem.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCScheduleItem : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *title;

+ (NSString *)parseClassName;

@end
