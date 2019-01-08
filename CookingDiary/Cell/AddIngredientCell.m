//
//  AddIngredientCell.m
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "AddIngredientCell.h"

@implementation AddIngredientCell

- (void)setData:(IngredientModel *)model {
    self.titleLabel.text = model.name;
    self.qtyLabel.text = model.amount;
}

@end
