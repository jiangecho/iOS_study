//
//  Person.m
//  helloWorld
//
//  Created by jiangecho on 15/5/4.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)enterInfo{
    NSLog(@"first name please:");
    char cstring[40];
    scanf("%c", cstring);
    
    firstName = [NSString stringWithCString:cstring encoding:1];
}

-(void)printInfo{
    NSLog(@"firstName: %@", firstName);
}

+(void)printInfos{
    NSLog(@"class method: %@", [Person hello:@"world"]);
}

+(NSString*)hello:(NSString*)world{
    return world;
}
@end
