//
//  ContentsViewController.m
//  TextAudioBooks
//
//  Created by 김인로 on 2016. 10. 6..
//  Copyright © 2016년 highwill. All rights reserved.
//

#import "BookCoverViewController.h"
#import "ContentsViewController.h"

@interface BookCoverViewController ()
{
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *contentsButton;
    IBOutlet UIButton *fullVersionButton;
    
    IBOutlet UIActivityIndicatorView *activityIndicator;
}
@property (strong, nonatomic) UIView *overlayView;


@end

@implementation BookCoverViewController

//@synthesize appRecord;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [imageView.layer setBorderColor: [[UIColor whiteColor] CGColor]];
    [imageView.layer setBorderWidth: 3.0];
    
    [activityIndicator setHidden:YES];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"iPhoneBack" ofType:@"png"];
    
    imageView.image =  [UIImage imageWithContentsOfFile:path];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:239.0/255.0 green:238.0/255.0 blue:244.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.translucent = NO;
}


- (IBAction)fullVersion:(id)sender
{
    NSString * urlString = @"https://itunes.apple.com/kr/app/strange-case-dr.-jekyll-mr./id404151440?mt=8";
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response;
    NSError *error;
    //send it synchronous
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    // check for an error. If there is a network error, you should handle it here.
    if(!error)
    {
        //log response
        NSLog(@"Response from server = %@", responseString);
    }
}

#pragma mark - Segues

// This is the IBAction method referenced in the Storyboard Exit for the Unwind segue.
// It needs to be here to create a link for the unwind segue.
// But we'll do nothing with it.
- (IBAction)unwindFromViewController:(UIStoryboardSegue *)sender
{
    //NSLog(@"unwindFromViewController");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        ContentsViewController *controller = (ContentsViewController *)[segue destinationViewController];
        
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}


@end
