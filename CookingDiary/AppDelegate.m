//
//  AppDelegate.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "AppDelegate.h"
#import "DBManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *docsDir = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"cooking.db"]];
    NSLog(@"Path: %@", databasePath);
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath] == NO) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"cooking" ofType:@"db"];
        NSLog(@"%@",resourcePath);
        if (resourcePath == NULL) {
            NSLog(@"Failed to open/create database");
        }
        NSError *err;
        [fileManager copyItemAtPath:resourcePath toPath:databasePath error:&err];
        if (err) {
            NSLog(@"\nError : %@", err);
        } else {
            NSLog(@"\n Database Created: %@", err);
        }
    }
    return YES;
}

@end
