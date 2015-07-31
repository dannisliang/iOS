//
//  HCAboutViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCAboutViewController.h"

#import <Parse/Parse.h>

#import "HCAbout.h"


@interface HCAboutViewController ()

@property (nonatomic, strong) NSArray *aboutContent;

@end

@implementation HCAboutViewController

static NSString * const HCAboutMapIdentifier = @"AboutMapIdentifier";
static NSString * const HCAboutDescriptionIdentifier = @"AboutDescriptionIdentifier";
static NSString * const HCAboutDateIdentifier = @"AboutDateIdentifier";
static NSString * const HCAboutSocialNetworkIdentifier = @"AboutSocialNetwork";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCAboutMapIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCAboutMapIdentifier];
    
    UINib *tableViewCellNib2 = [UINib nibWithNibName:HCAboutDescriptionIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib2
         forCellReuseIdentifier:HCAboutDescriptionIdentifier];
    
    UINib *tableViewCellNib3 = [UINib nibWithNibName:HCAboutDateIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib3
         forCellReuseIdentifier:HCAboutDateIdentifier];
    
    UINib *tableViewCellNib4 = [UINib nibWithNibName:HCAboutSocialNetworkIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib4
         forCellReuseIdentifier:HCAboutSocialNetworkIdentifier];
}

@end
