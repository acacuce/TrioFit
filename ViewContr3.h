//
//  ViewContr3.h
//  TrioFit
//
//  Created by Наталья on 09.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewContr3 : UIViewController

@property (weak, nonatomic)
IBOutlet UIStepper
*stepper;

@property (weak, nonatomic)
IBOutlet UILabel
*counterLabel;

- (IBAction)stepperValueChanged:(id)sender;

@end
