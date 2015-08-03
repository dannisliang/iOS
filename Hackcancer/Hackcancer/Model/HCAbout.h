//
//  HCAbout.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCAbout : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *mapTitle;
@property (nonatomic, strong) NSString *directionsTitle;
@property (nonatomic, strong) PFGeoPoint *hackLocation;
@property (nonatomic, strong) PFFile *mapPinIcon;
@property (nonatomic, strong) NSString *viewTitle;
@property (nonatomic, strong) NSString *aboutDescription;
@property (nonatomic, strong) PFFile *eventIcon;
@property (nonatomic, strong) NSDate *eventStartDate;
@property (nonatomic, strong) NSDate *eventEndDate;

+ (NSString *)parseClassName;

@end
