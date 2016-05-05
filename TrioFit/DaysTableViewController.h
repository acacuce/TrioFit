//
//  DaysTableViewController.h
//  TrioFit
//
//  Created by Наталья on 20.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaysTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSString *forwardButtonString;

@end
