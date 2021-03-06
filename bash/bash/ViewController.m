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
#import "ShowViewController.h"

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
    
    if ([[segue identifier] isEqualToString:@"showDetails"])
    {
        // Get reference to the destination view controller
        ShowViewController *showViewController = [segue destinationViewController];
        showViewController.entry = (Entry *)sender;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) tableViewDidSelectEntry:(Entry *)entry {
    [self performSegueWithIdentifier:@"showDetails" sender:entry];
}

- (void) tableViewDidInitiateFetch {
    [self.activityIndicator startAnimating];
}

- (void) tableViewDidFinishFetch {
    [self.activityIndicator stopAnimating];
    self.containerView.hidden = NO;
}
@end
