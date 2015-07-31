//
//  HCFAQTableViewCell.h
//  Hackcancer
//
//  Created by Swift, Robert on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCFAQTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *questionLabel;
@property (nonatomic, strong) IBOutlet UILabel *answerLabel;

@end