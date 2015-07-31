//
//  HCNewsArticleTableViewCell.h
//  Hackcancer
//
//  Created by James Campbell on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ParseUI/ParseUI.h>

@interface HCNewsArticleTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *articleTitleLabel;
@property (nonatomic, strong) IBOutlet PFImageView *articleImageView;

@end
