//
//  HCNewsArticleViewController.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCNewsArticleViewController.h"

@interface HCNewsArticleViewController ()

@end

@implementation HCNewsArticleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.article.title;
}

@end
