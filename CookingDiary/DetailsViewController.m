//
//  DetailsViewController.m
//  CookingDiary
//
//  Created by Roger Molas on 04/01/2019.
//  Copyright © 2019 Roger Molas. All rights reserved.
//

#import "DetailsViewController.h"
#import "IngredientCell.h"

@interface DetailsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.details.name;
    
    self.titleLabel.text = _details.name;
    self.peopleLabel.text = [NSString stringWithFormat:@"%ld People(s)",(long)_details.people ];
    self.gramsLabel.text = _details.grams;
    NSString *base64String = [NSString stringWithFormat:@"data:image/png;base64,%@", _details.image];
    NSURL *url = [NSURL URLWithString:base64String];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IngredientCell * cell = (IngredientCell *)
    [tableView dequeueReusableCellWithIdentifier:@"Ingradient Cell" forIndexPath:indexPath];
    cell.titleLabel.text = @"iii";
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
