//
//  HCMapViewController.m
//  Hackcancer
//
//  Created by Robert Swift on 31/07/2015.
//  Copyright (c) 2015 Hackcancer. All rights reserved.
//

#import "HCMapViewController.h"

#import <ParseUI/ParseUI.h>
#import <MapKit/MapKit.h>

@interface HCMapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation HCMapViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.mapView.delegate = self;
    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.about.hackLocation.latitude, self.about.hackLocation.longitude), MKCoordinateSpanMake(0.004f, 0.004f));
    
    MKPointAnnotation *hackCancerVenueLocationPin = [[MKPointAnnotation alloc]init];
    hackCancerVenueLocationPin.coordinate=CLLocationCoordinate2DMake(self.about.hackLocation.latitude, self.about.hackLocation.longitude);
    [self.mapView addAnnotation:hackCancerVenueLocationPin];
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

@end
