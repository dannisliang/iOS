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

@end

@implementation HCNewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    PFQuery *newsArticleQuery = [PFQuery queryWithClassName:[HCNewsArticle parseClassName]];
    NSArray *newsArticleObjects = [newsArticleQuery findObjects];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
