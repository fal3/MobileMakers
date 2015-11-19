//
//  ViewController.m
//  IntergalacaticTraveler
//
//  Created by alex fallah on 5/12/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "RootViewController.h"
#import "TravelViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender
{
    TravelViewController *vc = segue.destinationViewController;
    vc.title = sender.titleLabel.text;
    if ([segue.identifier isEqualToString:@"redDwarfSegue"]) {
        vc.isBlueStar = NO;
    }else{
        vc.isBlueStar = YES;
    }
}

@end
