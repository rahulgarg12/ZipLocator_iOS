//
//  FirstViewController.m
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import "FirstViewController.h"
#import "NetworkHandler.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_txtField setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)findBtn:(id)sender {
    NetworkHandler *netHandlerObject = [[NetworkHandler alloc] init];
    
    [netHandlerObject fetchData:_txtField.text];
    
    if (netHandlerObject.responseCode == 323) {
        _resultTxt.text = @"Please enter a valid Postal Code";
    }
    else {
        NSString *dictData = [NSString stringWithFormat:@" PIN : %@\n Region : %@\n City : %@\n Country : %@",                      netHandlerObject.pincode,
                          netHandlerObject.region,
                          netHandlerObject.city,
                          netHandlerObject.country];
        _resultTxt.text = dictData;
    }
}

-(void)textFieldShouldReturn:(UITextField *)textField
{
    [_txtField resignFirstResponder];
}

@end
