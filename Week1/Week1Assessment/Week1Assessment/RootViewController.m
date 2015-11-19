//
//  ViewController.m
//  Week1Assessment
//
//  Created by alex fallah on 5/15/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "RootViewController.h" 
#import "WebViewController.h"
@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueOneLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoLabel ;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answer = 0;

}
- (IBAction)onCalculateTapped:(UIButton *)sender {
    self.answer = self.valueOneLabel.text.intValue * self.valueTwoLabel.text.intValue;
    self.navTitleBar.title = [NSString stringWithFormat:@"%i",self.answer ];
    //disable web button if it's divisible by 5
    if (self.answer % 5 == 0) {
        self.webButton.enabled = YES;
    } else {
        self.webButton.enabled = NO;
    }
    //declaring delegates
    self.valueTwoLabel.delegate = self;
    self.valueOneLabel.delegate = self;
    //getting rid of the keyboard method
    [self textFieldShouldReturn:self.valueTwoLabel];
    [self textFieldShouldReturn:self.valueOneLabel];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender{
    WebViewController *wvc = segue.destinationViewController;
    wvc.title = self.navTitleBar.title;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //resign first responder gets rid of the keyboard
    [textField resignFirstResponder];
    return YES;
}
@end
