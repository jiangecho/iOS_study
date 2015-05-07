//
//  PlayerCell.h
//  Ratings
//
//  Created by jiangecho on 15/5/7.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell
@property(nonatomic, strong) IBOutlet UILabel* playerLabel;
@property(nonatomic, strong) IBOutlet UILabel* gameLabel;
@property(nonatomic, strong) IBOutlet UIImageView* ratingImageView;

@end
