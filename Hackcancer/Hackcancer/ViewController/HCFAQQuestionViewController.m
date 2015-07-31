//
//  HCNewsArticleViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCFAQQuestionViewController.h"

@interface HCFAQQuestionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation HCFAQQuestionViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.question.title;
    self.questionLabel.text = self.question.question;
    self.answerLabel.text = self.question.answer;
}

@end
