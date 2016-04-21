//
//  ViewContr3.m
//  TrioFit
//
//  Created by Наталья on 09.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import "ViewContr3.h"
#import "ViewContr2.h"
#import "DaysTableViewController.h"


@interface ViewContr3 ()


@end

@implementation ViewContr3

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"isCreated" forKey:@"program"];
    
    self.stepper.wraps = YES;
    self.stepper.autorepeat = YES;
    self.counterLabel.text = @"1";
    self.stepper.minimumValue = 1;
    
    self.stepper.maximumValue = 7;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"forwardToSegue"]) {
    DaysTableViewController *destinatViewController = segue.destinationViewController;
    destinatViewController.forwardButtonString = _counterLabel.text;
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}

- (IBAction)stepperValueChanged:(id)sender {
    NSUInteger value = _stepper.value;
    _counterLabel.text = [NSString stringWithFormat:@"%d",value];
    
    
}
@end
