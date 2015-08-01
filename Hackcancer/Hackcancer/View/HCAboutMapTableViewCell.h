//
//  HCAboutMapTableViewCell.h
//  Hackcancer
//
//  Created by James Campbell on 01/08/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HCAboutMapTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
