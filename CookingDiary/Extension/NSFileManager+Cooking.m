//
//  NSFileManager+Cooking.m
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "NSFileManager+Cooking.h"

@implementation NSFileManager (Cooking)
- (NSString *)stringByDocPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

- (NSString *)stringByDocPathAppendingPathComponent:(NSString *)Component {
    return [[self stringByDocPath] stringByAppendingPathComponent:Component];
}
@end
