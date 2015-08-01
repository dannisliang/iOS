//
//  HCAboutDateTableViewCell.h
//  Hackcancer
//
//  Created by James Campbell on 01/08/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ParseUI/ParseUI.h>

@interface HCAboutDateTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet PFImageView *eventIcon;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;

@end
