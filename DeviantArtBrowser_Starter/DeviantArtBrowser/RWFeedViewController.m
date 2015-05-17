//
//  RWTableViewController.m
//  DeviantArtBrowser
//
//  Created by Joshua Greene on 4/1/14.
//  Copyright (c) 2014 Razeware, LLC. All rights reserved.
//

#import "RWFeedViewController.h"

#import <AFNetworking/UIKit+AFNetworking.h>
#import <MediaRSSParser/MediaRSSParser.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "RWDetailViewController.h"

static NSString * const RWDeviantArtBaseURLString = @"http://backend.deviantart.com/rss.xml";

@implementation RWFeedViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setUpParser];
  [self refreshData];
}

- (void)setUpParser {
  self.parser = [[RSSParser alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self deselectAllRows];
}

- (void)deselectAllRows {
  for (NSIndexPath *indexPath in [self.tableView indexPathsForSelectedRows]) {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
  }
}

#pragma mark - Refresh

- (IBAction)refreshData {
  [self.searchTextField resignFirstResponder];
  [self parseForQuery:self.searchTextField.text];
}

- (void)parseForQuery:(NSString *)query {
  [self showProgressHUD];
  
  __weak typeof(self) weakSelf = self;
  
  [self.parser parseRSSFeed:RWDeviantArtBaseURLString
                 parameters:[self parametersForQuery:query]
                    success:^(RSSChannel *channel) {
                      
                      [weakSelf convertItemsPropertiesToPlainText:channel.items];
                      [weakSelf setFeedItems:channel.items];
                      
                      [weakSelf reloadTableViewContent];
                      [weakSelf hideProgressHUD];
                      
                    } failure:^(NSError *error) {
                      
                      [weakSelf hideProgressHUD];
                      NSLog(@"Error: %@", error);
                    }];
}

- (void)showProgressHUD {
  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
  [[MBProgressHUD HUDForView:self.view] setLabelText:@"Loading"];
}

- (NSDictionary *)parametersForQuery:(NSString *)query {
  if (query.length) {
    return @{@"q": [NSString stringWithFormat:@"by:%@", query]};
    
  } else {
    return @{@"q": @"boost:popular"};
  }
}

- (void)hideProgressHUD {
  [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)convertItemsPropertiesToPlainText:(NSArray *)items {
  for (RSSItem *item in items) {
    NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    item.title = [[item.title stringByConvertingHTMLToPlainText] stringByTrimmingCharactersInSet:charSet];
    item.mediaDescription = [[item.mediaDescription stringByConvertingHTMLToPlainText] stringByTrimmingCharactersInSet:charSet];
    item.mediaText = [[item.mediaText stringByConvertingHTMLToPlainText] stringByTrimmingCharactersInSet:charSet];
  }
}

- (void)reloadTableViewContent {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
    [self.tableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
  });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  #warning - Implement This
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  #warning - Implement This
  return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  #warning - Implement This
  return 0.0f;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [self refreshData];
  return NO;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
  RSSItem *item = self.feedItems[indexPath.row];
  
  RWDetailViewController *viewController = [segue destinationViewController];
  viewController.item = item;
}

@end
