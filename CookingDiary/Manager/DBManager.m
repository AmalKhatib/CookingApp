//
//  DBManager.m
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "DBManager.h"

static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;

@implementation DBManager

+ (DBManager *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DBManager alloc] init];
//        [sharedInstance createDB];
    });
    return sharedInstance;
}

- (BOOL)createDB {
    NSString *docsDir; NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    NSLog(@"%@", docsDir);
    // Build the path to the database file
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"cooking.db"]];
    
    BOOL isSuccess = YES;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: databasePath ] == NO) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"cooking" ofType:@"db"];
        if (resourcePath == NULL) {
            NSLog(@"Failed to open/create database");
            return NO;
        }
        
        if ([fileManager copyItemAtPath:resourcePath toPath:docsDir error:nil]) {
            sqlite3_close(database);
            return isSuccess;
        } else {
            isSuccess = NO;
            NSLog(@"Failed to open/create database");
        }
        NSLog(@"%@", docsDir);
        
        
//        const char *dbpath = [databasePath UTF8String];
//        if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
//            char *errMsg;
//            const char *sql_stmt =
//            "create table if not exists recipe (name text primary key, people integer, grams double)";
//
//            if (sqlite3_exec(database, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK) {
//                isSuccess = NO;
//                NSLog(@"Failed to create table");
//            }
//            sqlite3_close(database);
//            return isSuccess;
//        } else {
//            isSuccess = NO;
//            NSLog(@"Failed to open/create database");
//        }
    }
    return isSuccess;
}

- (BOOL)insertData:(NSString *)query
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        const char *insert_stmt = [query UTF8String];
        sqlite3_prepare_v2(database, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE) {
            sqlite3_reset(statement);
            return YES;
        } else {
            sqlite3_reset(statement);
            return NO;
        }
    }
    return NO;
}

- (NSArray *)findBy:(NSString *)query
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK) {
        const char *query_stmt = [query UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc] init];
        if (sqlite3_prepare_v2(database, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSLog(@"iterate");
                NSString *name = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 0)];
                [resultArray addObject:name];
                
                NSString *department = [[NSString alloc] initWithUTF8String: (const char *) sqlite3_column_text(statement, 1)];
                [resultArray addObject:department];
                
                NSString *year = [[NSString alloc]initWithUTF8String: (const char *) sqlite3_column_text(statement, 2)];
                [resultArray addObject:year];
            }
            sqlite3_reset(statement);
            return resultArray;
            
        } else {
            NSLog(@"Not found");
            return nil;
        }
    }
    return nil;
}
@end
