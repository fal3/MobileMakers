//
//  ViewController.m
//  MinorityReport
//
//  Created by alex fallah on 5/14/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (weak, nonatomic) IBOutlet UILabel *thePrecogsLabel;
@property CGPoint startingPoint;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.startingPoint = self.theFutureLabel.center;

}
- (IBAction)didPan:(UIPanGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    self.theFutureLabel.center = point;

    if (CGRectContainsPoint(self.thePrecogsLabel.frame, point)) {
        self.theFutureLabel.text = @"an incriminated future";
        [self.theFutureLabel sizeToFit];
    }

    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:1 animations:^
        {
            self.theFutureLabel.center = self.startingPoint;


        }completion:^(BOOL finished)
        {
            if (finished)
            {
                self.thePrecogsLabel.text =@"Thats your future";
            }
        }
         ];
    }

}


@end
