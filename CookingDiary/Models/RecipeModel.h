//
//  RecipeModel.h
//  CookingDiary
//
//  Created by Roger Molas on 08/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCModel.h"

@interface RecipeModel : FCModel

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger people;
@property(nonatomic, strong) NSString *grams;
@property(nonatomic, strong) NSString *image;

- (instancetype)initWithFMResultSet:(FMResultSet *)set;
+ (NSMutableArray *)queryAll;
@end



@interface Recipe : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger people;
@property(nonatomic, strong) NSString *grams;
@property(nonatomic, strong) NSString *image;
@end
