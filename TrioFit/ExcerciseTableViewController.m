//
//  ExcerciseTableViewController.m
//  TrioFit
//
//  Created by Наталья on 20.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import "ExcerciseTableViewController.h"
#import "NameOfExcerciseViewController.h"
#import "ProgramFordayTableVC.h"

@interface ExcerciseTableViewController ()

@property (nonatomic, strong) NSArray *powerExcerciseArray;
@property (nonatomic, strong) NSArray *jogaExcerciseArray;
@property (nonatomic, strong) NSArray *stretchingExcerciseArray;
@property (nonatomic, strong) NSMutableArray *selectedItemsArray;
@property (nonatomic, strong) NSArray *currentArray;

@property (nonatomic, strong) NSIndexPath *currentIndexPath;
@property (nonatomic, strong) NSIndexPath *currentDoneIndexPath;

@property (nonatomic,strong) NSArray *dayFirstArray;
@property (nonatomic,strong) NSArray *daySecondArray;
@property (nonatomic,strong) NSArray *dayThirdArray;
@property (nonatomic,strong) NSArray *dayFourthArray;
@property (nonatomic,strong) NSArray *dayFifthArray;
@property (nonatomic,strong) NSArray *daySixthArray;
@property (nonatomic,strong) NSArray *daySeventhArray;


@end

@implementation ExcerciseTableViewController
@synthesize currentArray = _currentArray;

- (NSArray *)currentArray
{
    if (_currentArray == nil) {
        if ([_excerciseButtonString isEqualToString:@"power"])
            _currentArray = _powerExcerciseArray;
        if ([_excerciseButtonString isEqualToString:@"joga"])
            _currentArray = _jogaExcerciseArray;
        if ([_excerciseButtonString isEqualToString:@"stretching"])
            _currentArray = _stretchingExcerciseArray;
    
    }
    return _currentArray;
}


-(NSArray*)selectdItemArray
{
    if(_selectedItemsArray == nil){
        if([_dayButtonString isEqualToString:@"День 1" ])
            _selectedItemsArray = _dayFirstArray;
        if([_dayButtonString isEqualToString:@"День 2" ])
            _selectedItemsArray = _daySecondArray;
        if([_dayButtonString isEqualToString:@"День 3" ])
            _selectedItemsArray = _dayThirdArray;
        if([_dayButtonString isEqualToString:@"День 4" ])
            _selectedItemsArray = _dayFourthArray;
        if([_dayButtonString isEqualToString:@"День 5" ])
            _selectedItemsArray = _dayFifthArray;
        if([_dayButtonString isEqualToString:@"День 6" ])
            _selectedItemsArray = _daySixthArray;
        if([_dayButtonString isEqualToString:@"День 7" ])
            _selectedItemsArray = _daySeventhArray;
    }
    return _selectedItemsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedItemsArray = [NSMutableArray new];
    
    
    if (_isCreating == YES) {
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barButtonPressed:)];
        
        
    self.navigationItem.rightBarButtonItem = doneBarButton;
        
        
        
        
    }
    
    _powerExcerciseArray = @[@"Жим лежа", @"Становая тяга", @"Приседания со штангой ", @"Руки", @"Ноги"];
    _jogaExcerciseArray = @[@"Молитвенная поза", @"Поза с поднятыми руками", @"Растянутая поза наклон ", @"Поза наездника", @"Поза собака мордой вниз", @"Поза планки"];
    _stretchingExcerciseArray = @[@"Гибкость спины ", @"Растяжка на пресс", @"Растяжка для ног "];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)actionForBarButton
{
    [self performSegueWithIdentifier:@"doneSegue" sender:nil];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.currentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    cell.textLabel.text = _currentArray[indexPath.row];
    return cell;
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isCreating == YES) {
        NSString *nameOfSelectedExercise = [_currentArray objectAtIndex:indexPath.row];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryNone) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [_selectedItemsArray addObject:nameOfSelectedExercise];
            _currentDoneIndexPath = indexPath;
        }else {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [_selectedItemsArray removeObject:nameOfSelectedExercise];
            _currentDoneIndexPath = indexPath;
            
        }
    }
}
//
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

- (void)barButtonPressed:(id)sender{
    
    [self performSegueWithIdentifier:@"progrramForDaySegue" sender:self];
    
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *moreInformationAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Detail" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        
        _currentIndexPath = indexPath;
        
        [self performSegueWithIdentifier:@"detailInformationSegue" sender:self];
        
    }];

    moreInformationAction.backgroundColor = [UIColor blueColor];
    return @[moreInformationAction];
}


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
    
    if ([segue.identifier isEqualToString:@"detailInformationSegue"]) {
        
        NameOfExcerciseViewController *destinationViewController = segue.destinationViewController;
       
        destinationViewController.nameOfExcercise = [_currentArray objectAtIndex:_currentIndexPath.row];
    
    }
    
    if([segue.identifier isEqualToString:@"progrramForDaySegue"]){
        
         ProgramFordayTableVC *destVC = segue.destinationViewController;
        destVC.programForDayArray = _selectedItemsArray  ;
    
        
        }

}


@end
