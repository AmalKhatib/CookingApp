//
//  DBManager.h
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject
{
    NSString *databasePath;
}

+ (DBManager *)shared;
- (BOOL)insertData:(NSString *)query;
- (NSArray *)findBy:(NSString *)query;

@end
