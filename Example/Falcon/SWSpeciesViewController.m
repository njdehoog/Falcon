//
//  SWSpeciesViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWSpeciesViewController.h"

@implementation SWSpeciesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [self.film getSpeciesWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];

        self.items = result.items;
        [self.tableView reloadData];
    }];
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    SWSpecies *species = (SWSpecies *)item;
    cell.textLabel.text = species.name;
    cell.detailTextLabel.text = species.classification;
}

@end
