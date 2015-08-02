//
//  HCAbout.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCAbout : PFObject<PFSubclassing>

@property (nonatomic, strong) PFGeoPoint *hackLocation;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *aboutDescription;
@property (nonatomic, strong) PFFile *eventIcon;
@property (nonatomic, strong) NSDate *eventStartDate;
@property (nonatomic, strong) NSDate *eventEndDate;
@property (nonatomic, strong) NSString *facebookTitle;
@property (nonatomic, strong) NSString *twitterTitle;
@property (nonatomic, strong) NSString *instagramTitle;
@property (nonatomic, strong) NSString *emailTitle;
@property (nonatomic, strong) PFFile *facebookIcon;
@property (nonatomic, strong) PFFile *twitterIcon;
@property (nonatomic, strong) PFFile *instagramIcon;
@property (nonatomic, strong) PFFile *emailIcon;

+ (NSString *)parseClassName;

@end
