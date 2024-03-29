//
//  HCNewsViewController.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCNewsViewController.h"

#import <Parse/Parse.h>

#import "HCNewsArticle.h"
#import "HCUserInterface.h"

#import "HCNewsArticleTableViewCell.h"
#import "HCNewsArticleViewController.h"

@interface HCNewsViewController ()

@property (nonatomic, strong) NSArray *newsArticles;
@property (nonatomic, strong) NSArray *userInterface;

@end

@implementation HCNewsViewController

static NSString * const HCNewsArticleIdentifier = @"NewsArticleTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *newsArticleQuery = [PFQuery queryWithClassName:[HCNewsArticle parseClassName]];
    self.newsArticles = [newsArticleQuery findObjects];
    
    PFQuery *userInterfaceQuery = [PFQuery queryWithClassName:[HCUserInterface parseClassName]];
    self.userInterface = [userInterfaceQuery findObjects];

    HCUserInterface *userInterface = self.userInterface.firstObject;
    self.title = userInterface.viewTitle;
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCNewsArticleIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCNewsArticleIdentifier];
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsArticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCNewsArticle *article = self.newsArticles[indexPath.row];
    
    HCNewsArticleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:HCNewsArticleIdentifier];
    
    cell.articleTitleLabel.text = article.title;
    cell.articleImageView.file = article.image;
    
    cell.articleImageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.articleImageView.clipsToBounds = YES;
    
    [cell.articleImageView loadInBackground];
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCNewsArticle *article = self.newsArticles[indexPath.row];
    
    HCNewsArticleViewController *articleViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"NewsArticle"];
    articleViewController.article = article;
    
    [self.navigationController pushViewController:articleViewController
                                         animated:YES];
}

@end
