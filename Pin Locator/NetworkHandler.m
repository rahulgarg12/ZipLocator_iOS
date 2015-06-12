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

- (void) fetchData : (NSString*) pinString {
    if ([pinString length] == 0) {
        NSLog(@"Postal code field can't be nil");
    }
    else {
        NSLog(@"Fetching data.. ");
    
        NSString *urlString = [NSString stringWithFormat: @"https://www.WhizAPI.com/api/v2/util/ui/in/indian-city-by-postal-code?AppKey=spx1ly96n8a74virku2ic8tb&pin=%@",pinString];
        NSURL *baseURL = [NSURL URLWithString: urlString];
        NSData *urlData = [NSData dataWithContentsOfURL:baseURL];
    
        NSError *jsonError = [[NSError alloc] init];
    
        _responseCode = 0;
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
            [self getFromArray];
        }
    }
}

- (void) getFromArray {
    NSDictionary *dataDict = [dataArray objectAtIndex:0];
    _pincode = dataDict[@"Pincode"];
    _country = dataDict[@"Country"];
    _city = dataDict[@"City"];
    _region = dataDict[@"Address"];
}

@end