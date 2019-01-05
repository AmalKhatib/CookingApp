//
//  NSFileManager+Cooking.h
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Cooking)

- (NSString *)stringByDocPath;

- (NSString *)stringByDocPathAppendingPathComponent:(NSString *)Component;
@end
