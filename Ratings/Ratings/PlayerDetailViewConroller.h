//
//  PlayerDetailViewConroller.h
//  Ratings
//
//  Created by jiangecho on 15/5/7.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@class PlayerDetailViewConroller;
@protocol PlayerDetailViewControllerDelegate <NSObject>

-(void)playerDetailViewControllerDidCancel:(PlayerDetailViewConroller*)controller;
-(void)playerDetailViewControllerDidSave:(PlayerDetailViewConroller*)controller addPlayer:(Player*)player;
@end


@interface PlayerDetailViewConroller : UITableViewController
@property(nonatomic, weak) id<PlayerDetailViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end
