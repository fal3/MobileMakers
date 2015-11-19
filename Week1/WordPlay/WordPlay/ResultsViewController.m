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

  NSDictionary *attributesDictionary = @{NSFontAttributeName : [UIFont boldSystemFontOfSize: 13], NSForegroundColorAttributeName: [UIColor blueColor]};



  NSAttributedString *nameAtt = [[NSAttributedString alloc] initWithString:self.name attributes:attributesDictionary];
  NSAttributedString *paragraph1 = [[NSAttributedString alloc] initWithString:@" bla bla bla "];
  NSAttributedString *adjectiveAtt = [[NSAttributedString alloc] initWithString:self.adjective attributes:attributesDictionary];
  NSAttributedString *paragraph2 = [[NSAttributedString alloc] initWithString:@" bla bla bla bla "];
  NSAttributedString *anotherAtt = [[NSAttributedString alloc] initWithString:self.anotherAdjective attributes:attributesDictionary];
  NSAttributedString *paragraph3 = [[NSAttributedString alloc] initWithString:@" bla bla bla bla bla "];
  NSAttributedString *animalAtt = [[NSAttributedString alloc] initWithString:self.animal attributes:attributesDictionary];
  NSAttributedString *paragraph4 = [[NSAttributedString alloc] initWithString:@" bla bla bla bla bla bla "];

    NSMutableAttributedString *attributeCompleteText = [[NSMutableAttributedString alloc] initWithAttributedString:nameAtt];

    NSArray *sentenceArray = @[nameAtt, paragraph1,adjectiveAtt,paragraph2,anotherAtt,paragraph3,animalAtt,paragraph4];
//    NSDictionary *vars = @{ self.name : [NSAttributedString *nameAtt]};

    //sentence
//    NSString *strTextView = [NSString string]

//    NSRange *range = [string rangeOfString:self.variable]

//    NSMutableAttributedString *variable? = [[NSMutableAttributedString alloc] initWithString:string];

    for (int i = 0; i<sentenceArray.count; i++){
        [attributeCompleteText appendAttributedString:sentenceArray[i]];
    }
//
//  [attributeCompleteText appendAttributedString:paragraph1];
//  [attributeCompleteText appendAttributedString:adjectiveAtt];
//  [attributeCompleteText appendAttributedString:paragraph2];
//  [attributeCompleteText appendAttributedString:anotherAtt];
//  [attributeCompleteText appendAttributedString:paragraph3];
//  [attributeCompleteText appendAttributedString:animalAtt];
//  [attributeCompleteText appendAttributedString:paragraph4];

  self.resultsTextView.attributedText = attributeCompleteText;
}


@end






