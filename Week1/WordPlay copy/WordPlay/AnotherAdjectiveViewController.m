//
//  AnotherAdjectiveViewController.m
//  WordPlay
//
//  Created by alex fallah on 5/12/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "AnotherAdjectiveViewController.h"
#import "AnimalViewController.h"
@interface AnotherAdjectiveViewController ()
@property (weak, nonatomic) IBOutlet UITextField *anotherAdjectiveTextField;

@end

@implementation AnotherAdjectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:()sender
{
    if (self.anotherAdjectiveTextField.text.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    AnimalViewController *animalVC = segue.destinationViewController;
    animalVC.name = self.name;
    animalVC.adjective = self.adjective;
    animalVC.anotherAdjective = self.anotherAdjectiveTextField.text;
}

@end
