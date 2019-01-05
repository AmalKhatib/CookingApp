//
//  AppDelegate.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "AppDelegate.h"
#import "DBManager.h"
#import "NSFileManager+Cooking.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [[DBManager shared] insertData:@"insert into studentsDetail (regno,name, department, year) values (\"5\",\"Roger 5\", \"12\", \"2010\")"];
    NSArray * results = [[DBManager shared] findBy:@"select name, department, year from studentsDetail where department=\"12\""];
    NSLog(@"%@", results);
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

@end
