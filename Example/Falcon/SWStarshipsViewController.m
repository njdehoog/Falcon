//
//  SWStarshipsViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWStarshipsViewController.h"

@implementation SWStarshipsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [self.film getStarshipsWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];
        
        self.items = result.items;
        [self.tableView reloadData];
    }];
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    SWStarship *starship = (SWStarship *)item;
    cell.textLabel.text = starship.name;
    cell.detailTextLabel.text = starship.model;
}

@end
