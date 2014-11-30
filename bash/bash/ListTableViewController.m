//
//  ListTableViewController.m
//  bash
//
//  Created by Piotr Pałek on 29.11.2014.
//  Copyright (c) 2014 netguru-training. All rights reserved.
//

#import "ListTableViewController.h"
#import "Entry.h"
#import "EntriesManager.h"
#import <MessageUI/MessageUI.h>
#import "ListTableViewCell.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface ListTableViewController () <ListMenuProtocol, MFMailComposeViewControllerDelegate>
@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) EntriesManager *manager;

- (void)updateCell:(ListTableViewCell *)cell;
- (void)getLatestData;
- (void)pullDownRefresh;
@end

@implementation ListTableViewController

- (void)updateCell:(ListTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)addEntry:(NSString *)body user:(NSString *)user {
    if (!_manager) {
        self.manager = [EntriesManager alloc];
    }
    __weak typeof(self) weakSelf = self;
    Entry *newEntry = [[Entry alloc] initWithBody:body user:user score:0];
    [self.manager add:newEntry completion:^(NSArray *entry, NSError *error) {
        if (!error) {
            [weakSelf.tableView reloadData];
        }
        else{
            [[[UIAlertView alloc] initWithTitle:@"ty baranie!"
                                        message:@"nasze api tego nie ogarnia..."
                                       delegate:nil
                              cancelButtonTitle:@"Ok"
                              otherButtonTitles:nil, nil
              ]
             show];
        }
    }];
}

- (void)showMenu:(Entry *)entry cell:(ListTableViewCell *)cell {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction* shareMailAction = [UIAlertAction actionWithTitle:@"E-mail" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [weakSelf displayComposerSheet:entry.body];
                                                          }];

    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {}];
    
    UIAlertAction* upvoteAction = [UIAlertAction actionWithTitle:@"Upvote" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action) {
                                                                [entry upvote];
                                                                [weakSelf updateCell:cell];
                                                            }];
    UIAlertAction* downvoteAction = [UIAlertAction actionWithTitle:@"Downvote" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             [entry downvote];
                                                             [weakSelf updateCell:cell];
                                                         }];
    [alert addAction:upvoteAction];
    [alert addAction:downvoteAction];
    [alert addAction:shareMailAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)viewDidLoad {
    // Initialize the refresh control.
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(pullDownRefresh)
                  forControlEvents:UIControlEventValueChanged];
    
    if (!_manager) {
        self.manager = [EntriesManager alloc];
    }
    
    [self getLatestData];
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)pullDownRefresh {
    [self getLatestData];
    [self.refreshControl endRefreshing];
}

- (void)getLatestData {
    [self.manager fetch:^(NSArray *posts, NSError *error) {
        [self.delegate tableViewDidInitiateFetch];
        if (!error) {
            [self.tableView reloadData];
            [self.delegate tableViewDidFinishFetch];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.manager removeAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.manager.entries count];
}

- (ListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"tableViewCell";

    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    Entry *entry = [self.manager.entries objectAtIndex:indexPath.row];
    cell.cellBody.text = entry.body;
    cell.cellScore.text = [NSString stringWithFormat:@"%li", (long)entry.score];
    cell.userNameLabel.text = entry.user;
    cell.delegate = self;
    cell.entry = entry;
    
    return cell;
}

-(void)displayComposerSheet:(NSString *) bashBody {
    if (![MFMailComposeViewController canSendMail]) {
        return;
    }
    
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:@"Here's a cool BashGuru link for you!"];
    
    // Fill out the email body text.
    [picker setMessageBody:bashBody isHTML:NO];
    
    // Present the mail composition interface.
    [self presentViewController:picker animated:YES completion:nil];
}

// The mail compose view controller delegate method
- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Entry *entry = [self.manager.entries objectAtIndex:indexPath.row];
    [self.delegate tableViewDidSelectEntry:entry];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
