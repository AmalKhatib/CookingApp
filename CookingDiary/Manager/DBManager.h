//
//  DBManager.h
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <FMDB/FMDatabase.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

@property (nonatomic) FMDatabase *db;
- (BOOL)isOpen;
- (BOOL)close;
- (FMResultSet *)query:(NSString *)statement;

+ (DBManager *)shared;
- (NSArray *)findBy:(NSString *)query;

@end
