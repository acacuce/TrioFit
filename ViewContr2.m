//
//  ViewContr2.m
//  TrioFit
//
//  Created by Наталья on 09.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import "ViewContr2.h"



@interface ViewContr2 ()
@property (strong, nonatomic) IBOutlet UIButton *programButton;

@end

@implementation ViewContr2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defualts = [NSUserDefaults standardUserDefaults];
    if (defualts objectForKey:@"program") {
        _programButton.tex
    }
    
    // Do any additional setup after loading the view.
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue {
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

@end
