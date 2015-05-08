//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject
@property(nonatomic, strong) NSString* name;
@property(nonatomic, assign) float rating;

-(instancetype)initWithTitle:(NSString*)title rating:(float)rating;

@end
