//
//  AddEntryViewController.h
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEntryViewController : UIViewController
@property(nonatomic, strong) IBOutlet UITextField *recipeField;
@property(nonatomic, strong) IBOutlet UITextField *peopleField;
@property(nonatomic, strong) IBOutlet UITextField *gramsField;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@end
