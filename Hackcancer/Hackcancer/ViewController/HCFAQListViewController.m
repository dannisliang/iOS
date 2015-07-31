//
//  HCFAQListViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCFAQListViewController.h"

#import "HCFAQItem.h"
#import "HCFAQTableViewCell.h"
#import "HCFAQQuestionViewController.h"


@interface HCFAQListViewController ()

@property (nonatomic, strong) NSArray *FAQItem;

@end

@implementation HCFAQListViewController

static NSString * const HCFAQItemIdentifier = @"HCFAQTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *FAQItemQuery = [PFQuery queryWithClassName:[HCFAQItem parseClassName]];
    self.FAQItem = [FAQItemQuery findObjects];
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCFAQItemIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCFAQItemIdentifier];
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.FAQItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCFAQItem *question = self.FAQItem[indexPath.row];
    
    HCFAQTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:HCFAQItemIdentifier];
    
    cell.questionLabel.text = question.question;
    cell.answerLabel.text = question.answer;
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCFAQItem *question = self.FAQItem[indexPath.row];
    
    HCFAQQuestionViewController *questionViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FAQQuestion"];
    questionViewController.question = question;
    
    [self.navigationController pushViewController:questionViewController
                                         animated:YES];
}


@end
