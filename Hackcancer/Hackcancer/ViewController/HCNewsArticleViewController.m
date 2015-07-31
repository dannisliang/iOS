//
//  HCNewsArticleViewController.m
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCNewsArticleViewController.h"

#import <ParseUI/ParseUI.h>

@interface HCNewsArticleViewController ()

@property (weak, nonatomic) IBOutlet PFImageView *newsArticleImageView;
@property (weak, nonatomic) IBOutlet UILabel *newsArticleTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsArticleContentLabel;

@end

@implementation HCNewsArticleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.article.title;
    self.newsArticleImageView.file = self.article.image;
    self.newsArticleTitleLabel.text = self.article.title;
    self.newsArticleContentLabel.text = self.article.content;
}

@end
