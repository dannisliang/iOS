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
#import "HCNewsArticleViewController.h"

@interface HCNewsViewController ()

@property (nonatomic, strong) NSArray *newsArticles;

@end

@implementation HCNewsViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *newsArticleQuery = [PFQuery queryWithClassName:[HCNewsArticle parseClassName]];
    self.newsArticles = [newsArticleQuery findObjects];
    
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
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.textLabel.text = article.title;
    
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
