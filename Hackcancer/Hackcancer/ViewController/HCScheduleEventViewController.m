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

@end

@implementation HCScheduleEventViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.event.title;
    self.eventImageView.file = self.event.image;
    self.eventTitleLabel.text = self.event.title;
    self.eventContentLabel.text = self.event.content;
}

@end
