//
//  PlayerViewControlTableViewController.h
//  Ratings
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailViewConroller.h"

@interface PlayersViewControl : UITableViewController <PlayerDetailViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray* plays;

@end
