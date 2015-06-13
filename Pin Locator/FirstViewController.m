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
    if ([[_txtField text] length] == 0) {
        NSLog(@"Postal code field can't be nil");
    }
    else {
        NetworkHandler *netHandlerObject = [NetworkHandler sharedHandler];
    
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
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_txtField resignFirstResponder];
    return YES;
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([_txtField.text length] >= 6){
        
        [textField resignFirstResponder];
    }
    return YES;
}

@end
