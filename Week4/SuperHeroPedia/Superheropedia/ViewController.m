//
//  ViewController.m
//  Superheropedia
//
//  Created by Ben Bueltmann on 3/17/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "Superhero.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray *heroes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];





    [Superhero fetch:^(NSArray *fetchedHeroes) {
        self.heroes = fetchedHeroes;
        [self.tableView reloadData];
    }];





}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heroes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SuperheroesID"];
    Superhero *superhero = [self.heroes objectAtIndex:indexPath.row];
    cell.textLabel.text = superhero.name;
    cell.detailTextLabel.text = superhero.textDescription;

    [superhero fetchAvatarImage:^(UIImage *avatarImage)
     {
         cell.imageView.image = avatarImage;
         [cell layoutSubviews];
     }];

    return cell;
}



@end
