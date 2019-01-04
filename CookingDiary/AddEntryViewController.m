//
//  AddEntryViewController.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "AddEntryViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddEntryViewController ()
@property (nonatomic, strong) IBOutlet UITextView *textview;
@property (nonatomic, strong) IBOutlet UITextView *tagTextview;

@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.textview layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.textview layer] setBorderWidth:0.5];
    [[self.textview layer] setCornerRadius:0];
    
    [[self.tagTextview layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self.tagTextview layer] setBorderWidth:0.5];
    [[self.tagTextview layer] setCornerRadius:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
