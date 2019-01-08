//
//  DetailsViewController.h
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeModel.h"
@interface DetailsViewController : UIViewController
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *peopleLabel;
@property (nonatomic, strong) IBOutlet UILabel *gramsLabel;

@property(nonatomic) Recipe *details;
@end
