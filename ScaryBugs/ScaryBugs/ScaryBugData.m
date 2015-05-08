//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

-(instancetype)initWithTitle:(NSString *)title rating:(float)rating{
    if (self = [super init]) {
        self.name = title;
        self.rating = rating;
    }
     return self;
}

@end
