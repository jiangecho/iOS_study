//
//  PlayerViewControlTableViewController.m
//  Ratings
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "PlayersViewControl.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayersViewControl()

@end

@implementation PlayersViewControl
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.plays count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"forIndexPath:indexPath];
    
    // Configure the cell...
    /*
    UILabel* nameLabel = (UILabel*)[cell viewWithTag:100];
    UILabel* gameLabel = (UILabel*)[cell viewWithTag:101];
    UIImageView* starImageView = (UIImageView*)[cell viewWithTag:102];
     */
    
    UILabel* nameLabel = ((PlayerCell*)cell).playerLabel;
    UILabel* gameLabel = ((PlayerCell*)cell).gameLabel;
    UIImageView* starImageView = ((PlayerCell*)cell).ratingImageView;
    
    Player* player = [self.plays objectAtIndex:indexPath.row];
    nameLabel.text = player.name;
    gameLabel.text = player.game;
    starImageView.image = [self imageForRating:player.rating];
    
    return cell;
}

-(UIImage*)imageForRating:(int)rating{
    UIImage* image = nil;
    NSString* bundlePath = [[NSBundle mainBundle]bundlePath];
    NSMutableString* imagePath;
    switch (rating) {
        case 1:
            image = [UIImage imageNamed:@"1StarSmall.png"];
            break;
        case 2:
            image = [UIImage imageNamed:@"2StarsSmall.png"];
            break;
       case 3:
            imagePath = [NSMutableString stringWithFormat:@"%@%@", bundlePath, @"/3StarsSmall.png"];
            image = [UIImage imageNamed:imagePath];
            break;
        case 4:
            image = [UIImage imageNamed:@"4StarsSmall.png"];
            break;
        case 5:
            image = [UIImage imageNamed:@"5StarsSmall.png"];
            break;
            
        default:
            break;
    }
    return image;
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
