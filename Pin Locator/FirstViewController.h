//
//  FirstViewController.h
//  Pin Locator
//
//  Created by Rahul Garg on 12/06/15.
//  Copyright (c) 2015 Rahul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtField;
@property (weak, nonatomic) IBOutlet UITextView *resultTxt;

- (IBAction)findBtn:(id)sender;

@end

