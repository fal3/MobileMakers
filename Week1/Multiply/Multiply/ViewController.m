//
//  ViewController.m
//  Multiply
//
//  Created by alex fallah on 5/11/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@property (weak, nonatomic) IBOutlet UILabel *inputLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    int numberFromTextField = finalInput.intValue;
    int numberFromMultiplierLabel = self.multiplierLabel.text.intValue;
    int answer = numberFromTextField * numberFromMultiplierLabel;
    NSString *answerString = [NSString stringWithFormat:@"%i",answer];
    NSInteger result;

    if (result > 20) {
        self.backgroundView.backgroundColor = [UIColor greenColor];
        self.answerLabel.text = answerString;
    }


    if (result % 3 == 0 && result % 5 == 0){
        self.answerLabel.text = @"fizzbuzz";
    } else if (result % 5 == 0){
        self.answerLabel.text = @"buzz";
    }else if(result% 3 ==0 ){
        self.answerLabel.text = @"fizz";
    }else{
         self.backgroundView.backgroundColor = [UIColor whiteColor];
         self.answerLabel.text = answerString;
    }



    //for the segmented control operators

    //selectedSegmentIndex at 0 should be the first item in the index
    //you need to type cast on segment control because the values are float
    if ((long)self.operatorSegmentControl.selectedSegmentIndex == 0)
    {
        int numberFromTextField = finalInput.intValue;
        result = numberFromMultiplierLabel * numberFromTextField;
        self.inputLabel.text = finalInput;
    } else if ((long)self.operatorSegmentControl.selectedSegmentIndex == 1){
        int numberFromTextField = finalInput.intValue;
        result = numberFromTextField / numberFromMultiplierLabel ;
        //int converted to a string
        self.answerLabel.text = [NSString stringWithFormat:@"%li",(long)result];

    }

}


//multiplier or second value
- (IBAction)setMultiplierValue:(UISlider *)sender {
    float multiplierFloat = sender.value;
    int intMultiplier = (int)multiplierFloat;
    NSString *newMultiplier = [NSString stringWithFormat:@"%i",intMultiplier ];
    self.multiplierLabel.text = newMultiplier;
}


//append to this string
//all these methods make the input value for the calculator with a custom keyboard

NSString *finalInput = @"";
- (IBAction)oneTapped:(UIButton *)sender {
//    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"1"];
    finalInput = [finalInput stringByAppendingString:@"1"];
    self.inputLabel.text = finalInput;
}
- (IBAction)twoTapped:(UIButton *)sender {
    finalInput = [finalInput stringByAppendingString:@"2"];
    self.inputLabel.text = finalInput;
}
- (IBAction)threeTapped:(UIButton *)sender {
    finalInput = [finalInput stringByAppendingString:@"3"];
    self.inputLabel.text = finalInput;
}
- (IBAction)fourTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@",finalInput,@"4"];
    self.inputLabel.text = finalInput;
}
- (IBAction)fiveTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"5"];
    self.inputLabel.text = finalInput;
}
- (IBAction)sixTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"6"];
    self.inputLabel.text = finalInput;
}
- (IBAction)sevenTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"7"];
    self.inputLabel.text = finalInput;
}
- (IBAction)eightTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"8"];    self.inputLabel.text = finalInput;
}
- (IBAction)nineTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"9"];
    self.inputLabel.text = finalInput;
}
- (IBAction)zeroTapped:(UIButton *)sender {
    finalInput  = [NSString stringWithFormat:@"%@%@", finalInput,@"0"];    self.inputLabel.text = finalInput;
    self.inputLabel.text = finalInput;
}
- (IBAction)clearTapped:(UIButton *)sender {
    finalInput = @"";
    self.inputLabel.text = finalInput;
}





@end
