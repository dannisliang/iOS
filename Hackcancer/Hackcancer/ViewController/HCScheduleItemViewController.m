//
//  HCScheduleItemViewController.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCScheduleItemViewController.h"

#import "HCScheduleItem.h"
#import "HCScheduleItemTableViewCell.h"

@interface HCScheduleItemViewController ()

@property (nonatomic, strong) NSArray *scheduleItems;

@end

@implementation HCScheduleItemViewController

static NSString * const HCScheduleItemIdentifier = @"ScheduleItemTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *scheduleIeemQuery = [PFQuery queryWithClassName:[HCScheduleItem parseClassName]];
    self.scheduleItems = [scheduleIeemQuery findObjects];
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCScheduleItemIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCScheduleItemIdentifier];
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.scheduleItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCScheduleItem *article = self.scheduleItems[indexPath.row];
    
    HCScheduleItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:HCScheduleItemIdentifier];
    
    cell.titleView.text = article.title;
    
    return cell;
}

@end
