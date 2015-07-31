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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
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

@end
