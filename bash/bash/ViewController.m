//
//  ViewController.m
//  bash
//
//  Created by Radosław Piątek on 29/11/14.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewController.h"
#import "AddViewController.h"

@interface ViewController () <ListTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"listView"])
    {
        // Get reference to the destination view controller
        self.tableController = [segue destinationViewController];
        self.tableController.delegate = self;
    }
    
    if ([[segue identifier] isEqualToString:@"addView"])
    {
        // Get reference to the destination view controller
        AddViewController *addViewController = [segue destinationViewController];
        addViewController.tableController = self.tableController;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) tableViewDidSelectEntry:(Entry *)entry {
    [self performSegueWithIdentifier:@"showDetails" sender:entry];
}

- (void) tableViewDidInitialFetch {
    self.activityIndicator.hidden = YES;
    self.containerView.hidden = NO;
}
@end
