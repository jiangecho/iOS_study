//
//  main.m
//  helloWorld
//
//  Created by jiangecho on 15/5/4.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Person* person = [[Person alloc]init];
        
        [person enterInfo];
        [person printInfo];
        [Person printInfos];
    }
    return 0;
}
