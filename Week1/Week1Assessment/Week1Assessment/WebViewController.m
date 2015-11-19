//
//  WebViewController.m
//  Week1Assessment
//
//  Created by alex fallah on 5/15/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

#import "WebViewController.h"
#import "RootViewController.h"
@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *webView;



@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    [self loadRequestWithText:@"http://www.mobilemakers.co"];
    self.activityIndicator.hidden = false;
}
-(void)loadRequestWithText:(NSString *)text
{
    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest: request];
}
#pragma mark - UIWebViewDelegate Methods
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = true;
}

@end
