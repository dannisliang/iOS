//
//  HCScheduleEventViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCScheduleEventViewController.h"

#import <ParseUI/ParseUI.h>

@interface HCScheduleEventViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *eventImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTimeLabel;

@property (nonatomic, strong) NSDateFormatter *dateFormat;

@end

@implementation HCScheduleEventViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.dateFormat = [[NSDateFormatter alloc] init];
    self.dateFormat.dateFormat = @"HH:mm";
    self.dateFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
    self.navigationItem.title = self.event.title;
    self.eventImageView.file = self.event.image;
    self.eventTitleLabel.text = self.event.title;
    self.eventTimeLabel.text = [self.dateFormat stringFromDate:self.event.time];
    self.eventContentLabel.text = self.event.content;
    
    self.eventImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.eventImageView loadInBackground];
}

@end
