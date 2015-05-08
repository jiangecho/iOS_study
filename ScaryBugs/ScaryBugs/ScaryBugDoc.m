//
//  ScaryBugDoc.m
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "ScaryBugDoc.h"

@implementation ScaryBugDoc

-(instancetype)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage{
    if (self = [super init]) {
        self.data = [[ScaryBugData alloc]initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}

@end
