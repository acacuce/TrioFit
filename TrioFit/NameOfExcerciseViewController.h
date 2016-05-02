//
//  NameOfExcerciseViewController.h
//  TrioFit
//
//  Created by Наталья on 20.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface NameOfExcerciseViewController : UIViewController 

@property (nonatomic,strong) NSString *nameOfExcercise;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSString *youtubeIdentifierString;


-(IBAction) play:(id)sender;


@end