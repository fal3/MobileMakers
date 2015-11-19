//
//  ResultsViewController.m
//  WordPlay
//
//  Created by Adriana Jimenez Mangas on 5/12/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

@end

@implementation ResultsViewController




- (void)viewDidLoad {
    [super viewDidLoad];

//     NSString *textCopy = @"%@ walked into the club with a %@, they thought they were %@ but really they were %@ ";

  NSString *text = [NSString stringWithFormat:@"%@ walked into the club with a %@, they thought they were %@ but really they were %@ ",self.name,self.adjective,self.anotherAdjective,self.animal];

//    for (int i =0; i < textCopy.length;i++){
//        if ([textCopy containsString:@"%@"]){
//            NSLog(@"HII");
//        }
//
//        NSArray *controllers = @[self.name,self.adjective,self.anotherAdjective,self.animal];
//
//        for (NSString *property in controllers) {
//            NSLog(@"%@", property);
//            text = [textCopy stringByReplacingOccurrencesOfString:@"%@" withString:controllers[0]];
//            NSLog(@"%@",text);
//
//        }
//    for(int i = 0; i < text.length; i++){
//        if ([text containsString:@"%@",self.name]){
            NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
            [attributedText addAttributes:@{NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
                                            NSForegroundColorAttributeName: [UIColor greenColor],
                                            NSKernAttributeName: @2.0}

                                    range:NSMakeRange(0, self.name.length)];

            self.resultsTextView.attributedText = attributedText;
//        }


//    }

}






@end
