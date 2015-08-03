//
//  HCAboutViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCAboutViewController.h"

#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>
#import <MapKit/MapKit.h>
#import <MessageUI/MessageUI.h>

#import "HCAbout.h"
#import "HCSocialNetworks.h"
#import "HCEmailSettings.h"
#import "HCUserInterface.h"

#import "HCAboutDateTableViewCell.h"
#import "HCAboutDescriptionTableViewCell.h"
#import "HCAboutMapTableViewCell.h"
#import "HCAboutSocialNetworkTableViewCell.h"


@interface HCAboutViewController () <MFMailComposeViewControllerDelegate, UITableViewDelegate, MKMapViewDelegate>

@property (nonatomic, strong) NSArray *aboutContent;
@property (nonatomic, strong) NSArray *socialNetworks;
@property (nonatomic, strong) NSArray *emailSettings;
@property (nonatomic, strong) NSArray *userInterface;

@property (nonatomic, strong) NSDateFormatter *dateFormat;

@end

@implementation HCAboutViewController

static NSString *HCAboutDescriptionIdentifier = @"HCAboutDescriptionTableViewCell";
static NSString *HCAboutMapIdentifier = @"HCAboutMapTableViewCell";
static NSString *HCAboutDateIdentifier = @"HCAboutDateTableViewCell";
static NSString *HCAboutSocialNetworkIdentifier = @"HCAboutSocialNetworkTableViewCell";

#pragma mark - View Controller Lifecycle

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self tableData] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self tableData] objectAtIndex:section] count];
}

- (NSArray *)tableData {
    return @[
             @[
                 HCAboutDescriptionIdentifier,
                 HCAboutMapIdentifier,
                 HCAboutDateIdentifier,
                 ],
             @[
                 HCAboutSocialNetworkIdentifier,
                 HCAboutSocialNetworkIdentifier,
                 HCAboutSocialNetworkIdentifier,
                 HCAboutSocialNetworkIdentifier,
                 HCAboutSocialNetworkIdentifier
                 ],
             @[
                 HCAboutSocialNetworkIdentifier
                 ]
             ];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *aboutContentQuery = [PFQuery queryWithClassName:[HCAbout parseClassName]];
    self.aboutContent = [aboutContentQuery findObjects];
    
    PFQuery *socialNetworksQuery = [PFQuery queryWithClassName:[HCSocialNetworks parseClassName]];
    self.socialNetworks = [socialNetworksQuery findObjects];
    
    PFQuery *emailSettingsQuery = [PFQuery queryWithClassName:[HCEmailSettings parseClassName]];
    self.emailSettings = [emailSettingsQuery findObjects];
    
    PFQuery *userInterfaceQuery = [PFQuery queryWithClassName:[HCUserInterface parseClassName]];
    self.userInterface = [userInterfaceQuery findObjects];
    
    
    HCUserInterface *userInterface = self.userInterface[1];
    self.title = userInterface.viewTitle;
    
//    self setTintColor:[UIColor colorWithRed:[userInterface.primaryR floatValue] green:[userInterface.primaryG floatValue] blue:[userInterface.primaryB floatValue] alpha:1.0]];
    
    self.dateFormat = [[NSDateFormatter alloc] init];
    self.dateFormat.dateFormat = @"HH:mm";
    self.dateFormat.locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
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
    
    self.tableView.estimatedRowHeight = 44.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[self tableData][indexPath.section][indexPath.row] forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
                HCAbout *about = self.aboutContent.firstObject;
        
                id identifier = [self tableData][indexPath.section][indexPath.row];
        
                if  ([identifier isEqualToString:HCAboutDescriptionIdentifier]) {
                    cell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutDescriptionIdentifier];
                    ((HCAboutDescriptionTableViewCell *)cell).aboutDescriptionLabel.text = about.aboutDescription;
                    }
        
                if ([identifier isEqualToString:HCAboutMapIdentifier]) {
                    cell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutMapIdentifier];
                    ((HCAboutMapTableViewCell *)cell).mapView.delegate = self;
                    ((HCAboutMapTableViewCell *)cell).mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(about.hackLocation.latitude, about.hackLocation.longitude), MKCoordinateSpanMake(0.004f, 0.004f));
                    
                    MKPointAnnotation *hackCancerVenueLocationPin = [[MKPointAnnotation alloc]init];
                    hackCancerVenueLocationPin.coordinate=CLLocationCoordinate2DMake(about.hackLocation.latitude, about.hackLocation.longitude);
                    [((HCAboutMapTableViewCell *)cell).mapView addAnnotation:hackCancerVenueLocationPin];
                    }
                    
                if ([identifier isEqualToString:HCAboutDateIdentifier]) {
                    cell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutDateIdentifier];
                    ((HCAboutDateTableViewCell *)cell).eventIcon.file = about.eventIcon;
                    ((HCAboutDateTableViewCell *)cell).eventDate.text = [self.dateFormat stringFromDate:about.eventStartDate];
                    }

        } else if (indexPath.section == 1){
                HCSocialNetworks *socialNetworks = self.socialNetworks[indexPath.row];
            
                id identifier = [self tableData][indexPath.section][indexPath.row];
            
                if ([identifier isEqualToString:HCAboutSocialNetworkIdentifier]) {
                    cell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
                    ((HCAboutSocialNetworkTableViewCell *)cell).socialNetworkTitleLabel.text = socialNetworks.socialNetworkTitle;
                    ((HCAboutSocialNetworkTableViewCell *)cell).socialNetworkIconImageView.file = socialNetworks.socialNetworkIcon;
            
                }
        } else if (indexPath.section == 2){
            HCEmailSettings *emailSettings = self.emailSettings[indexPath.row];
            
            id identifier = [self tableData][indexPath.section][indexPath.row];
            
            if ([identifier isEqualToString:HCAboutSocialNetworkIdentifier]) {
                cell = [self.tableView dequeueReusableCellWithIdentifier:HCAboutSocialNetworkIdentifier];
                ((HCAboutSocialNetworkTableViewCell *)cell).socialNetworkTitleLabel.text = emailSettings.emailTitle;
                ((HCAboutSocialNetworkTableViewCell *)cell).socialNetworkIconImageView.file = emailSettings.emailIcon;
            }
        }
    
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
    } else if (indexPath.section == 1) {
        HCSocialNetworks *socialNetworks = self.socialNetworks[indexPath.row];
        NSString *url = socialNetworks.socialNetworkAddress;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        
    } else if (indexPath.section == 2) {
        HCEmailSettings *emailSettings = self.emailSettings.firstObject;
        
        // Email Subject
        NSString *emailSubject = emailSettings.emailSubject;
        // Email Content
        NSString *emailBody = emailSettings.emailBody;
        // To address
        NSArray *recipients = [NSArray arrayWithObject:emailSettings.emailAddress];
        
        MFMailComposeViewController *email = [[MFMailComposeViewController alloc] init];
        email.mailComposeDelegate = self;
        [email setSubject:emailSubject];
        [email setMessageBody:emailBody isHTML:NO];
        [email setToRecipients:recipients];
        
        // Present mail view controller on screen
        [self presentViewController:email animated:YES completion:NULL];

    }
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    //if annotation is the user location, return nil to get default blue-dot...
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //create purple pin view for all other annotations...
    static NSString *reuseId = @"hello";
    
    MKPinAnnotationView *hackCancerVenueLocationPin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseId];
    
    
    if (hackCancerVenueLocationPin == nil)
    {
        hackCancerVenueLocationPin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
        hackCancerVenueLocationPin.image = [UIImage imageNamed:@"LogoMapPinpointIcon"];
        
    }
    else
    {
        //if re-using view from another annotation, point view to current annotation...
        hackCancerVenueLocationPin.annotation = annotation;
    }
    
    return hackCancerVenueLocationPin;
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
