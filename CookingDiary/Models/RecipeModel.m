//
//  RecipeModel.m
//  CookingDiary
//
//  Created by Roger Molas on 08/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "RecipeModel.h"
#import "DBManager.h"

@implementation RecipeModel

- (instancetype)initWithFMResultSet:(FMResultSet *)set {
    if (self = [super init]) {
        _name = [set stringForColumn:@"name"];
        _people = [set intForColumn:@"people"];
        _grams = [set stringForColumn:@"grams"];
        _image = [set stringForColumn:@"image"];
    }
    return self;
}

@end

@implementation Recipe

@end
