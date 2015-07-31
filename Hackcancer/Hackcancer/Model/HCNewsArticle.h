//
//  HCNewsArticle.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "PFObject.h"

@interface HCNewsArticle : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *title;

+ (NSString *)parseClassName;

@end
