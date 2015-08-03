//
//  HCEmailSettings.h
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCEmailSettings : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *emailIcon;
@property (nonatomic, strong) NSString *emailTitle;
@property (nonatomic, strong) NSString *emailSubject;
@property (nonatomic, strong) NSString *emailBody;
@property (nonatomic, strong) NSString *emailAddress;


+ (NSString *)parseClassName;

@end
