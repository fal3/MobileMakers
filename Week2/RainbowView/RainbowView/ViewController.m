//
//  ViewController.m
//  RainbowView
//
//  Created by alex fallah on 5/18/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSArray *colors;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colors = [NSArray arrayWithObjects:[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor], [UIColor greenColor],[UIColor blueColor], [UIColor colorWithRed:158/255.0f green:177/255.0f blue:234/255.0f alpha:1.0f],[UIColor colorWithRed:158/255.0f green:43/255.0f blue:208/255.0f alpha:1.0f], nil];


}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.colors.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];

    NSNumber *color = [self.colors objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"row %@", color];
    cell.backgroundColor = color;
    return cell;
}

@end
