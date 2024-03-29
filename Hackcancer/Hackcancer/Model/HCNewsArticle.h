//
//  HCNewsArticle.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <Parse/Parse.h>

@interface HCNewsArticle : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;

+ (NSString *)parseClassName;

@end
