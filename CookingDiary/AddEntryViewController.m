//
//  AddEntryViewController.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "AddEntryViewController.h"
#import "AddIngredientCell.h"

#import "IngredientModel.h"
#import "RecipeModel.h"
#import "DBManager.h"

@interface AddEntryViewController ()<UITableViewDelegate, UITableViewDataSource,
UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *addButton;

@property (nonatomic, strong) NSMutableArray *ingridients;
@property (nonatomic, strong) NSString *imageString;
@end

@implementation AddEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.addButton.layer setCornerRadius:self.addButton.frame.size.width / 2];
    self.ingridients = [[NSMutableArray alloc] init];
}

- (IBAction)saveData:(id)sender {
    if ([self.recipeField.text  isEqual: @""]) { return; }
    if ([self.peopleField.text  isEqual: @""]) { return; }
    if ([self.gramsField.text  isEqual: @""]) { return; }
    
    
    if ([[DBManager shared] isOpen]) {
        NSString *query = [NSString stringWithFormat:@"""insert into recipe """
                           """(name, people, grams, image) """
                           """values ('%@', '%ld', '%@', '%@')",
                           self.recipeField.text, [self.peopleField.text integerValue], self.gramsField.text, self.imageString];
        [RecipeModel executeUpdateQuery:query];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
                              IngredientModel *model = [[IngredientModel alloc] init];
                              model.name = alert.textFields[0].text;
                              model.amount = alert.textFields[1].text;
                              model.recipe = self.recipeField.text;
                              [self.ingridients insertObject:model atIndex:0];
                              
                              [self.tableView reloadData];
                                                    
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [alert addAction:add];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)addImage:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = @[(NSString*)kUTTypeImage];
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
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
    IngredientModel *model = _ingridients[indexPath.row];
    [cell setData:model];
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
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)imagePickerController: (UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    NSData *imageData = UIImagePNGRepresentation(_imageView.image);
    NSString *base64String = [imageData base64EncodedStringWithOptions:0];
    self.imageString = base64String;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
