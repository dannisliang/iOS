//
//  HCAboutViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCAboutViewController.h"

#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

#import "HCAbout.h"
#import "HCAboutDateTableViewCell.h"
#import "HCAboutDescriptionTableViewCell.h"
#import "HCAboutMapTableViewCell.h"
#import "HCAboutSocialNetworkTableViewCell.h"

static NSInteger const HCAboutNumberOfRows = 7;

typedef NS_ENUM(NSUInteger, HCAboutRow)
{
    HCAboutRowDescription = 0,
    HCAboutRowMap = 1,
    HCAboutRowDate = 2,
    HCAboutRowSocialNetworkFacebook = 3,
    HCAboutRowSocialNetworkTwitter = 4,
    HCAboutRowSocialNetworkInstagram = 5,
    HCAboutRowSocialNetworkEmail = 6
};

@interface HCAboutViewController ()

@property (nonatomic, strong) NSArray *aboutContent;
@property (nonatomic, assign, readonly) CLLocationCoordinate2D coordinate;

@property (nonatomic, strong) NSDateFormatter *dateFormat;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;


@end

@implementation HCAboutViewController

static NSString * const HCAboutMapIdentifier = @"HCAboutMapTableViewCell";
static NSString * const HCAboutDescriptionIdentifier = @"HCAboutDescriptionTableViewCell";
static NSString * const HCAboutDateIdentifier = @"HCAboutDateTableViewCell";
static NSString * const HCAboutSocialNetworkIdentifier = @"HCAboutSocialNetworkTableViewCell";

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dateFormat = [[NSDateFormatter alloc] init];
    self.dateFormat.dateFormat = @"HH:mm";
    self.dateFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
    PFQuery *aboutContentQuery = [PFQuery queryWithClassName:[HCAbout parseClassName]];
    self.aboutContent = [aboutContentQuery findObjects];
    
    UINib *tableViewCellNib = [UINib nibWithNibName:HCAboutDescriptionIdentifier
                                             bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib
         forCellReuseIdentifier:HCAboutDescriptionIdentifier];
    
    UINib *tableViewCellNib2 = [UINib nibWithNibName:HCAboutMapIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib2
         forCellReuseIdentifier:HCAboutMapIdentifier];
    
    
    UINib *tableViewCellNib3 = [UINib nibWithNibName:HCAboutDateIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib3
         forCellReuseIdentifier:HCAboutDateIdentifier];
    
    UINib *tableViewCellNib4 = [UINib nibWithNibName:HCAboutSocialNetworkIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib4
         forCellReuseIdentifier:HCAboutSocialNetworkIdentifier];
    
    UINib *tableViewCellNib5 = [UINib nibWithNibName:HCAboutSocialNetworkIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib5
         forCellReuseIdentifier:HCAboutSocialNetworkIdentifier];
    
    
    UINib *tableViewCellNib6 = [UINib nibWithNibName:HCAboutSocialNetworkIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib6
         forCellReuseIdentifier:HCAboutSocialNetworkIdentifier];
    
    UINib *tableViewCellNib7 = [UINib nibWithNibName:HCAboutSocialNetworkIdentifier
                                              bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:tableViewCellNib7
         forCellReuseIdentifier:HCAboutSocialNetworkIdentifier];
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return HCAboutNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    switch (indexPath.row)
    {
        case HCAboutRowDescription:
        {
            HCAbout *about = self.aboutContent[indexPath.row];
            
            HCAboutDescriptionTableViewCell *descriptionCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutDescriptionIdentifier];
            
            descriptionCell.aboutDescriptionLabel.text = about.aboutDescription;
            
            cell = descriptionCell;
            
            break;
        }
        case HCAboutRowMap:
        {
            HCAboutMapTableViewCell *mapCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutMapIdentifier];
            
            mapCell.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.332495f, -122.029095f),
                                                         MKCoordinateSpanMake(0.008516f, 0.021801f));
            
            cell = mapCell;
            
            break;
        }
        case HCAboutRowDate:
        {
            HCAbout *about = self.aboutContent[indexPath.row - 2];

            HCAboutDateTableViewCell *dateCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutDateIdentifier];
            
            dateCell.eventIcon.file = about.eventIcon;
            dateCell.eventDate.text = [self.dateFormat stringFromDate:about.eventStartDate];

            cell = dateCell;

            break;
        }
        case HCAboutRowSocialNetworkFacebook:
        {
            HCAbout *about = self.aboutContent[indexPath.row - 3];
            
            HCAboutSocialNetworkTableViewCell *facebookCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
            
            facebookCell.socialNetworkTitleLabel.text = about.facebookTitle;
            facebookCell.socialNetworkLogoImageView.file = about.facebookIcon;
            
            cell = facebookCell;
            
            break;
//        {
//        case HCAboutRowSocialNetworkTwitter:
//        {
//            HCAbout *about = self.aboutContent[indexPath.row - 4];
//            
//            HCAboutSocialNetworkTableViewCell *twitterCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
//            
//            twitterCell.socialNetworkTitleLabel.text = about.twitterTitle;
//            twitterCell.socialNetworkLogoImageView.file = about.twitterIcon;
//            
//            cell = twitterCell;
//            
//            break;
//        }
//        case HCAboutRowSocialNetworkInstagram:
//        {
//            HCAbout *about = self.aboutContent[indexPath.row - 5];
//            
//            HCAboutSocialNetworkTableViewCell *instagramCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
//            
//            instagramCell.socialNetworkTitleLabel.text = about.instagramTitle;
//            instagramCell.socialNetworkLogoImageView.file = about.instagramIcon;
//            
//            cell = instagramCell;
//            
//            break;
//        }
//        case HCAboutRowSocialNetworkEmail:
//        {
//            HCAbout *about = self.aboutContent[indexPath.row - 6];
//            
//            HCAboutSocialNetworkTableViewCell *emailCell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
//            
//            emailCell.socialNetworkTitleLabel.text = about.emailTitle;
//            emailCell.socialNetworkLogoImageView.file = about.emailIcon;
//            
//            cell = emailCell;
//            
//            break;
        }
    }
    return cell;
}
            

@end
