//
//  ViewController.m
//  tipCalculator
//
//  Created by Michael Cieplak on 1/9/17.
//  Copyright © 2017 Michael Cieplak. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}
- (IBAction)onValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}

-(void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute the tip and total
    NSArray *tipValues = @[@(0.15), @(0.2), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    // Update the UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipValue"];
    NSLog(@"%i", intValue);
    if (intValue == 15) {
        self.tipControl.selectedSegmentIndex = 0;
    }
    else if (intValue == 20) {
        self.tipControl.selectedSegmentIndex = 1;
    }
    else {
        self.tipControl.selectedSegmentIndex = 2;
    }
    
    [self updateValues];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSArray *tipValues = @[@(15), @(20), @(25)];
    int tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] intValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipAmount forKey:@"defaultTipValue"];
    [defaults synchronize];
}

@end
