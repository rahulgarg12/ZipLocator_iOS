//
//  SecondViewController.h
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SecondViewController : UIViewController <MKAnnotation>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;


@end

