//
//  AppDelegate.m
//  Ratings
//
//  Created by jiangecho on 15/5/6.
//  Copyright (c) 2015年 jiangecho. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersViewControl.h"


@interface AppDelegate ()
@property(nonatomic, strong) NSMutableArray* players;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.players = [NSMutableArray arrayWithCapacity:20];
    Player* player = [[Player alloc]init];
    player.name = @"jiang";
    player.game = @"game1";
    player.rating = 3;
    
    [self.players addObject:player];
    
    player = [[Player alloc]init];
    player.name = @"echo";
    player.game = @"game2";
    player.rating = 5;
    
    [self.players addObject:player];
    
    UITabBarController* tabBarController = (UITabBarController* )self.window.rootViewController;
    
    UINavigationController* navigationController = [[tabBarController viewControllers] objectAtIndex:0];
    PlayersViewControl* playersViewControl = [[navigationController viewControllers] objectAtIndex:0];
    playersViewControl.plays = self.players;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
