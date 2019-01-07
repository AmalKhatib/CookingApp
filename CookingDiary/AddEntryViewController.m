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

@interface AddEntryViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *addButton;
@property (nonatomic, strong) NSMutableArray *ingridients;
@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.addButton.layer setCornerRadius:self.addButton.frame.size.width / 2];
    self.ingridients = [[NSMutableArray alloc] init];
}

- (IBAction)addIngridient:(id)sender {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Add ingridient" message:nil
                                preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"Name"];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        [textField setPlaceholder:@"Amount"];
        [textField setKeyboardType:UIKeyboardTypeDecimalPad];
    }];
    
    UIAlertAction *add = [UIAlertAction
                          actionWithTitle:@"Add" style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * _Nonnull action) {
                              [self.ingridients insertObject:alert.textFields[0].text atIndex:0];
                              [self.tableView reloadData];
                                                    
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:add];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ingridients.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddIngredientCell * cell = (AddIngredientCell *)[tableView
                                                     dequeueReusableCellWithIdentifier:@"Add Ingredient Cell"
                                                     forIndexPath:indexPath];
    cell.titleLabel.text = _ingridients[indexPath.row];
    return cell;
}

// Edit Row

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_ingridients removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        NSLog(@"Edit");
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
