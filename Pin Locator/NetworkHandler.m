//
//  NetworkHandler.m
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkHandler.h"

@interface NetworkHandler ()

@end

NSArray *dataArray;

@implementation NetworkHandler

+ (id)sharedHandler {
    static NetworkHandler *sharedHandler = nil;
    @synchronized(self) {
        if (sharedHandler == nil)
            sharedHandler = [[self alloc] init];
    }
    return sharedHandler;
}

- (void) fetchData : (NSString*) pinString {
    
    NSString *urlString = [NSString stringWithFormat: @"https://www.WhizAPI.com/api/v2/util/ui/in/indian-city-by-postal-code?AppKey=spx1ly96n8a74virku2ic8tb&pin=%@",pinString];
    NSLog(@"Fetching data from URL %@",urlString);
    
    NSURL *baseURL = [NSURL URLWithString: urlString];
    NSData *urlData = [NSData dataWithContentsOfURL:baseURL];
    
    NSError *jsonError = [[NSError alloc] init];
    
    @try {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&jsonError];
        dataArray = [jsonDict objectForKey:@"Data"];
        _responseCode = (int) [jsonDict objectForKey:@"ResponseCode"];
    }
    @catch(NSException *e) {
        NSLog(@"Exception Generated %@",e);
    }
    
    if (_responseCode == 323) {
        NSLog(@"Response Code is %d",_responseCode);
    } else {
        NSDictionary *dataDict = [dataArray objectAtIndex:0];
        _pincode = dataDict[@"Pincode"];
        _country = dataDict[@"Country"];
        _city = dataDict[@"City"];
        _region = dataDict[@"Address"];
        
        [self fetchDataForMap];
    }
}

- (void) fetchDataForMap {
    NSString *urlString = [NSString stringWithFormat: @"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", _region];
    NSLog(@"Fetching coordinaes from Url %@",urlString);
    
    NSURL *baseURL = [NSURL URLWithString: urlString];
    NSData *urlData = [NSData dataWithContentsOfURL:baseURL];
    
    NSError *jsonError = [[NSError alloc] init];
    
    NSDictionary *jsonDict;
    @try {
        jsonDict = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&jsonError];
    }
    @catch (NSException *e) {
        NSLog(@"Exception Generated %@",e);
    }
    
    NSArray *dataArrayResults = [jsonDict objectForKey:@"results"];
    NSDictionary *dataDictResults = [dataArrayResults objectAtIndex:0];
    NSDictionary *dataDictGeometry = [dataDictResults objectForKey:@"geometry"];
    NSDictionary *dataLocation = [dataDictGeometry objectForKey:@"location"];
    _mapLat = [dataLocation objectForKey:@"lat"];
    _mapLong = [dataLocation objectForKey:@"lng"];
    
    NSLog(@"Lattitude is %@ and Longitude is %@",_mapLat,_mapLong);
}

@end