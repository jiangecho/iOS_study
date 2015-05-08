//
//  GamePickerViewController.h
//  Ratings
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GamePickerViewController;
@protocol GamePickerViewControllerDelete <NSObject>

-(void)gamePickerViewController:(GamePickerViewController*)contoller didSelectGame :(NSString*)game;

@end

@interface GamePickerViewController : UITableViewController
@property(nonatomic, weak)id<GamePickerViewControllerDelete> delegate;
@property(nonatomic, strong)NSString* game;
@end
