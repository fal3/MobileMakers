//
//  EnterNameViewController.m
//  WordPlay
//
//  Created by Adriana Jimenez Mangas on 5/12/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "EnterNameViewController.h"
#import "EnterAdjectiveViewController.h"

@interface EnterNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EnterNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:()sender
{
    if (self.nameTextField.text.length > 0) {
      return YES;
    } else {
      return NO;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {

    EnterAdjectiveViewController *adjVC = segue.destinationViewController;
    adjVC.name = self.nameTextField.text;
}



//Start over button links to these when you control drag the button
- (IBAction)unwindToRoot:(UIStoryboardSegue *)unwindSegue{
    
}


@end

