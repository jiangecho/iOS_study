//
//  Player.h
//  Ratings
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property(nonatomic, strong) NSString* name;
@property(nonatomic, strong) NSString* game;
@property(nonatomic, assign) int rating;

@end
