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
    IBOutlet UIButton *iTunesLinkButton;
    
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    
    NSString *iTunesLink;
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
    
    //Link Button
    
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"My" ofType:@"plist"]];
    NSLog(@"dictionary = %@", dictionary);
    
    NSArray *array = [dictionary objectForKey:@"Values"];
    NSLog(@"array = %@", array);
    
    [iTunesLinkButton setTitle:[array objectAtIndex:0] forState:UIControlStateNormal];
    
    NSLog(@"[array objectAtIndex:0] : %@", [array objectAtIndex:0]);
    
    NSString *url = [array objectAtIndex:1];
    
    iTunesLink = [@"itms://" stringByAppendingString:url];
    
    NSLog(@"iTunesLink : %@", iTunesLink);
}


- (IBAction)itunesLinkAction:(id)sender
{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
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
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
   // [self.navigationController setToolbarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   // [[UIApplication sharedApplication] setStatusBarHidden:NO];
}


@end
