//
//  SecondViewController.m
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import "SecondViewController.h"

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
    CLLocationCoordinate2D locationZoom;
    locationZoom.latitude = 46.0;
    locationZoom.longitude= 86.0;
    
    MKCoordinateRegion setViewRegion = MKCoordinateRegionMakeWithDistance(locationZoom, 1000, 1000);
    
    [_mapview setRegion:setViewRegion animated:YES];
    
    
}

- (void) fetchLatLong {
    
}

@end
