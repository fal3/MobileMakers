//
//  ViewController.m
//  Deprocrastinator
//
//  Created by alex fallah on 5/18/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource , UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tasksView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property NSMutableArray *tasks;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tasks = [NSMutableArray array];
    self.inputTextField.delegate = self;
    self.editing = false;

    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasks.count;

}


- (IBAction)onAddButtonPressed:(UIButton *)sender
{
    [self.tasks addObject:self.inputTextField.text];
    self.inputTextField.text = @"";
    [self textFieldShouldReturn:self.inputTextField];
    [self.tasksView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *taskCell = [tableView dequeueReusableCellWithIdentifier:@"TaskID" forIndexPath:indexPath];

    NSString *task = [self.tasks objectAtIndex:indexPath.row];
    taskCell.textLabel.text = [NSString stringWithFormat:@"%@",task];
    taskCell.textLabel.textColor = [UIColor blackColor];
    return taskCell;

}

//edit and delete stuff
- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {

    //edit button with array magic
    if (self.editing) {
        self.editing = false;
        [self.tasksView setEditing:false animated:true];
        sender.style = UIBarButtonItemStylePlain;
        sender.title = @"Edit";
    } else {
        self.editing = true;
        [self.tasksView setEditing:true animated:true];
        sender.style = UIBarButtonItemStyleDone;
        sender.title = @"Done";
    }

}

- (IBAction)onSwipe:(UISwipeGestureRecognizer *)sender
{
//    swiped view
//    UIView *cell = sender.view;
    //    UITableView *cell2 = (UITableView)sender.view;
    CGPoint swipeLocation = [sender locationInView:self.tasksView];
    NSIndexPath *swipeIndexPath = [self.tasksView indexPathForRowAtPoint:swipeLocation];
    UITableViewCell *cell = [self.tasksView cellForRowAtIndexPath:swipeIndexPath];

    [self setColor:cell];


}


-(bool) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *taskItem = [self.tasks objectAtIndex:sourceIndexPath.row];
    [self.tasks insertObject:taskItem atIndex:destinationIndexPath.row];
    [self.tasks removeObject:taskItem];


    //switches titles when dragging the items
}

-(void)setColor:(UITableViewCell*)cell
{
    if ([cell.textLabel.textColor isEqual:[UIColor greenColor]]) {
        cell.textLabel.textColor =  [UIColor yellowColor];
    } else if ([cell.textLabel.textColor isEqual:[UIColor yellowColor]]){
        cell.textLabel.textColor = [UIColor redColor];
    }else if ([cell.textLabel.textColor isEqual:[UIColor redColor]]){
        cell.textLabel.textColor = [UIColor greenColor];
    }else if ([cell.textLabel.textColor isEqual:[UIColor blackColor]]){
        cell.textLabel.textColor = [UIColor greenColor];
    }
    else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tasks removeObjectAtIndex:indexPath.row];
    //the object at that index of the array... remove it!
    [self.tasksView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",indexPath);
    cell.textLabel.textColor= [UIColor greenColor];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//gets rid of keyboard
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.inputTextField resignFirstResponder];
    return YES;
}









@end
