//
//  Person.h
//  helloWorld
//
//  Created by jiangecho on 15/5/4.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString* firstName;
    NSString* lastName;
    
}

-(void) enterInfo;
-(void) printInfo;

+(void) printInfos;
@end
