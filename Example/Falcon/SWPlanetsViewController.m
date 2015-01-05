//
//  SWPlanetsViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWPlanetsViewController.h"

@implementation SWPlanetsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [self.film getPlanetsWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];
        
        self.items = result.items;
        [self.tableView reloadData];
    }];
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    SWPlanet *planet = (SWPlanet *)item;
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.terrain;
}


@end
