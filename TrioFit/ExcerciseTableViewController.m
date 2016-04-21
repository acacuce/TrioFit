//
//  ExcerciseTableViewController.m
//  TrioFit
//
//  Created by Наталья on 20.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import "ExcerciseTableViewController.h"
#import "NameOfExcerciseViewController.h"

@interface ExcerciseTableViewController ()

@property (nonatomic,strong) NSArray *powerExcerciseArray;
@property (nonatomic,strong) NSArray *jogaExcerciseArray;
@property (nonatomic,strong) NSArray *stretchingExcerciseArray;

@end

@implementation ExcerciseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _powerExcerciseArray = @[@"Жим лежа", @"Становая тяга", @"Приседания со штангой ", @"Руки", @"Ноги"];
    _jogaExcerciseArray = @[@"Молитвенная поза", @"Поза с поднятыми руками", @"Растянутая поза наклон ", @"Поза наездника", @"Поза собака мордой вниз", @"Поза планки"];
    _stretchingExcerciseArray = @[@"Гибкость спины ", @"Растяжка на пресс", @"Растяжка для ног "];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if([_excerciseButtonString isEqualToString: @"power"]){
    return _powerExcerciseArray.count;
    }else if ([_excerciseButtonString isEqualToString: @"joga"]){
        return _jogaExcerciseArray.count;
    }else
        return _stretchingExcerciseArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    if([_excerciseButtonString isEqualToString: @"power"]){
        
        cell.textLabel.text = [_powerExcerciseArray objectAtIndex: indexPath.row];
    }else if ([_excerciseButtonString isEqualToString: @"joga"]){
        
        cell.textLabel.text = [_jogaExcerciseArray objectAtIndex: indexPath.row];
    }else {
        
        cell.textLabel.text = [_stretchingExcerciseArray objectAtIndex: indexPath.row];
    }

    

    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NameOfExcerciseViewController *destinationViewController = segue.destinationViewController;
    
    
    
    if([_excerciseButtonString isEqualToString: @"power"]){
        destinationViewController.nameOfExcercise = _powerExcerciseArray[[self.tableView indexPathForSelectedRow].row ];

        
    }else if ([_excerciseButtonString isEqualToString: @"joga"]){
        
        destinationViewController.nameOfExcercise = _jogaExcerciseArray[[self.tableView indexPathForSelectedRow].row];
    }else {
        
        destinationViewController.nameOfExcercise = _stretchingExcerciseArray[[self.tableView indexPathForSelectedRow].row];
    }

    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
