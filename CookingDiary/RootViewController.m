//
//  RootViewController.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "RootViewController.h"
#import "AddEntryViewController.h"
#import "DetailsViewController.h"

#import "RecipeModel.h"

#import "IngredientModel.h"
#import "DBManager.h"

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *list;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.list = [NSMutableArray new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.list removeAllObjects];
    NSString *SQL = [NSString stringWithFormat:@"select * from recipe"];
    DBManager *db = [DBManager shared];
    if ([db isOpen]) {
        FMResultSet *set = [db query:SQL];
        while ([set next]) {
            Recipe *model = [Recipe new];
            model.name = [set stringForColumn:@"name"];
            model.people = [set intForColumn:@"people"];
            model.grams = [set stringForColumn:@"grams"];
            model.image = [set stringForColumn:@"image"];
            [self.list addObject: model];
        }
        [db close];
    }
    [_tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue destinationViewController] isKindOfClass:[DetailsViewController class]]) {
        DetailsViewController *vc = (DetailsViewController *)[segue destinationViewController];
        vc.details = (Recipe *)sender;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableViewr {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    RecipeModel * model = self.list[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"View Details Segue" sender:self.list[indexPath.row]];
}
@end
