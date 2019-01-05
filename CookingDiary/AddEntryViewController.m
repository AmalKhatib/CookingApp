//
//  AddEntryViewController.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "AddEntryViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AddIngredientCell.h"

@interface AddEntryViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *addButton;
@property (nonatomic, strong) NSMutableArray *ingridients;
@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.addButton.layer setCornerRadius:self.addButton.frame.size.width / 2];
    self.ingridients = [[NSMutableArray alloc] initWithObjects:@"Roger", @"Ivan", @"Jp", nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableViewr {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ingridients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddIngredientCell * cell = (AddIngredientCell *)[tableView dequeueReusableCellWithIdentifier:@"Add Ingredient Cell" forIndexPath:indexPath];
    cell.titleLabel.text = _ingridients[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
