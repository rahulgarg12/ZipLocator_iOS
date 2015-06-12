//
//  NetworkHandler.h
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkHandler : NSObject

@property NSString *pincode;
@property NSString *country;
@property NSString *region;
@property NSString *city;

@property int responseCode;

@property NSString *mapLat;
@property NSString *mapLong;

- (void) fetchData : (NSString*) pinString;
- (void) getFromArray;

- (void) fetchDataForMap;

@end