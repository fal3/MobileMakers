//
//  AnimalViewController.m
//  WordPlay
//
//  Created by alex fallah on 5/12/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "AnimalViewController.h"
#import "ResultsViewController.h"

@interface AnimalViewController ()
@property (weak, nonatomic) IBOutlet UITextField *animalTextField;

@end

@implementation AnimalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:()sender
{
    if (self.animalTextField.text.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    ResultsViewController *resultVC = segue.destinationViewController;
    resultVC.name = self.name;
    resultVC.adjective = self.adjective;
    resultVC.anotherAdjective = self.anotherAdjective;
    resultVC.animal = self.animalTextField.text;
}




@end
