//
//  EnterAdjectiveViewController.m
//  WordPlay
//
//  Created by Adriana Jimenez Mangas on 5/12/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "EnterAdjectiveViewController.h"
#import "AnotherAdjectiveViewController.h"

@interface EnterAdjectiveViewController ()
@property (weak, nonatomic) IBOutlet UITextField *adjectiveTextField;

@end

@implementation EnterAdjectiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:()sender
{
  if (self.adjectiveTextField.text.length > 0) {
    return YES;
  } else {
    return NO;
  }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
  AnotherAdjectiveViewController *anotherVC = segue.destinationViewController;
    anotherVC.name = self.name;
    anotherVC.adjective = self.adjectiveTextField.text;
}




@end
