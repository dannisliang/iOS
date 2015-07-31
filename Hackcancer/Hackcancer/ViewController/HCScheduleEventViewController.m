//
//  HCScheduleEventViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCScheduleEventViewController.h"

@interface HCScheduleEventViewController ()

@end

@implementation HCScheduleEventViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.event.title;
}

@end
