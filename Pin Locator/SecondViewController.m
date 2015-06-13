//
//  SecondViewController.m
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import "SecondViewController.h"
#import "NetworkHandler.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NetworkHandler *netHandlerObject = [NetworkHandler sharedHandler];
    
    double mapLat = [netHandlerObject.mapLat doubleValue];
    double mapLong = [netHandlerObject.mapLong doubleValue];
    
    CLLocationCoordinate2D location;
    location.latitude = mapLat;
    location.longitude= mapLong;
    
    MKCoordinateRegion setViewRegion = MKCoordinateRegionMakeWithDistance(location, 500 ,50000);
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = location;
    [_mapview addAnnotation:annotation];
    
    [_mapview setRegion:setViewRegion animated:YES];
}

@end
