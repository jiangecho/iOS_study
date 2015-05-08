//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by jiangecho on 15/5/8.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ScaryBugData.h"

@interface ScaryBugDoc : NSObject
@property (nonatomic, strong) ScaryBugData* data;
@property (nonatomic, strong) UIImage* thumbImage;
@property (nonatomic, strong) UIImage* fullImage;

-(instancetype)initWithTitle: (NSString*)title rating:(float)rating thumbImage: (UIImage*)thumbImage fullImage: (UIImage*)fullImage;
@end
