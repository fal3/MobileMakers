
//
//  TravelViewController.m
//  IntergalacaticTraveler
//
//  Created by alex fallah on 5/12/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "TravelViewController.h"

@interface TravelViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;

@end

@implementation TravelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.isBlueStar) {
        self.view.backgroundColor = [UIColor blueColor];
        self.starImageView.image = [UIImage imageNamed:@"blueStar"];

    } else {
        self.view.backgroundColor = [UIColor redColor];
        self.starImageView.image = [UIImage imageNamed:@"redDwarf"];
    }

}






@end
