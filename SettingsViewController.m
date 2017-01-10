//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Michael Cieplak on 1/9/17.
//  Copyright © 2017 Michael Cieplak. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultTipValue"];
    NSLog(@"%i", intValue);
    if (intValue == 15) {
        self.defaultTipControl.selectedSegmentIndex = 0;
    }
    else if (intValue == 20) {
        self.defaultTipControl.selectedSegmentIndex = 1;
    }
    else {
        self.defaultTipControl.selectedSegmentIndex = 2;
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    NSArray *tipValues = @[@(15), @(20), @(25)];
    int tipAmount = [tipValues[self.defaultTipControl.selectedSegmentIndex] intValue];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipAmount forKey:@"defaultTipValue"];
    [defaults synchronize];
}

@end
