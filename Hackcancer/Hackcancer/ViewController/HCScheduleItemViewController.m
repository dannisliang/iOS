//
//  HCScheduleItemViewController.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCScheduleItemViewController.h"

#import "HCScheduleItem.h"
#import "HCUserInterface.h"

#import "HCScheduleItemTableViewCell.h"
#import "HCScheduleEventViewController.h"

@interface HCScheduleItemViewController ()

@property (nonatomic, strong) NSArray *scheduleEvents;
@property (nonatomic, strong) NSArray *userInterface;
@property (nonatomic, strong) NSDateFormatter *dateFormat;

@end

@implementation HCScheduleItemViewController

static NSString * const HCScheduleItemIdentifier = @"ScheduleItemTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dateFormat = [[NSDateFormatter alloc] init];
    self.dateFormat.dateFormat = @"HH:mm";
    self.dateFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
    PFQuery *scheduleItemQuery = [PFQuery queryWithClassName:[HCScheduleItem parseClassName]];
    self.scheduleEvents = [scheduleItemQuery findObjects];
    
    PFQuery *userInterfaceQuery = [PFQuery queryWithClassName:[HCUserInterface parseClassName]];
    self.userInterface = [userInterfaceQuery findObjects];
    
    HCUserInterface *userInterface = self.userInterface[3];
    self.title = userInterface.viewTitle;
    
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
    cell.eventTimeLabel.text = [self.dateFormat stringFromDate:event.time];
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCScheduleItem *event = self.scheduleEvents[indexPath.row];
    
    HCScheduleEventViewController *eventViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"ScheduleEvent"];
    eventViewController.event = event;
    
    [self.navigationController pushViewController:eventViewController
                                         animated:YES];
}

@end
