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

@property (nonatomic, strong) NSArray *scheduleEvents;

@end

@implementation HCScheduleItemViewController

static NSString * const HCScheduleItemIdentifier = @"ScheduleItemTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *scheduleItemQuery = [PFQuery queryWithClassName:[HCScheduleItem parseClassName]];
    self.scheduleEvents = [scheduleItemQuery findObjects];
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCScheduleItemIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCScheduleItemIdentifier];
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.scheduleEvents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCScheduleItem *event = self.scheduleEvents[indexPath.row];
    
    HCScheduleItemTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:HCScheduleItemIdentifier];
    
    cell.eventTitleLabel.text = event.title;
    cell.eventContentLabel.text = event.content;
    cell.eventTimeLabel.text = event.time;
    
    return cell;
}

@end
