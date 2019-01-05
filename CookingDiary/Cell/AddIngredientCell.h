//
//  AddIngredientCell.h
//  CookingDiary
//
//  Created by Roger Molas on 05/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddIngredientCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *qtyLabel;

- (void)setData:(NSDictionary *)info;
@end
