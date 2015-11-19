//
//  ViewController.h
//  Week1Assessment
//
//  Created by alex fallah on 5/15/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitleBar;
@property int answer;

@end

