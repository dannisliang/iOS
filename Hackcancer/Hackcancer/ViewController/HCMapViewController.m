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
    
    self.title = self.about.mapTitle;
    
    UIBarButtonItem *directionsButton = [[UIBarButtonItem alloc]
                                         initWithTitle:self.about.directionsTitle
                                         style:UIBarButtonItemStyleDone
                                         target:self
                                         action:@selector(onDirectionsButton)];
    self.navigationItem.rightBarButtonItem = directionsButton;
    
    
    self.mapView.delegate = self;
    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(self.about.hackLocation.latitude, self.about.hackLocation.longitude), MKCoordinateSpanMake(0.004f, 0.004f));
    
    MKPointAnnotation *hackCancerVenueLocationPin = [[MKPointAnnotation alloc]init];
    hackCancerVenueLocationPin.coordinate=CLLocationCoordinate2DMake(self.about.hackLocation.latitude, self.about.hackLocation.longitude);
    [self.mapView addAnnotation:hackCancerVenueLocationPin];
}

- (void)onDirectionsButton {
    MKPlacemark *placemark = [[MKPlacemark alloc]initWithCoordinate:CLLocationCoordinate2DMake(self.about.hackLocation.latitude, self.about.hackLocation.longitude) addressDictionary:nil];
    MKMapItem *myMapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    
    
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:[MKMapItem mapItemForCurrentLocation]];
    [request setDestination:myMapItem];
    [request setTransportType:MKDirectionsTransportTypeAny]; // This can be limited to automobile and walking directions.
    [request setRequestsAlternateRoutes:YES]; // Gives you several route options.
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (!error) {
            for (MKRoute *route in [response routes]) {
                [self.mapView addOverlay:[route polyline] level:MKOverlayLevelAboveRoads]; // Draws the route above roads, but below labels.
                // You can also get turn-by-turn steps, distance, advisory notices, ETA, etc by accessing various route properties.
            }
        }
    }];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
        [renderer setStrokeColor:[UIColor colorWithRed:(102.0/255.0) green:(51.0/255.0) blue:(153.0/255.0) alpha:1.0]];
        [renderer setLineWidth:5.0];
        return renderer;
    }
    return nil;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
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
