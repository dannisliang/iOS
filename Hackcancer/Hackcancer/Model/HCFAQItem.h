//
//  HCFAQItem.h
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCFAQItem : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *answer;

+ (NSString *)parseClassName;

@end
