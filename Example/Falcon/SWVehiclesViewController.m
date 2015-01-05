//
//  SWVehiclesViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWVehiclesViewController.h"

@implementation SWVehiclesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [self.film getVehiclesWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];
        
        self.items = result.items;
        [self.tableView reloadData];
    }];
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    SWVehicle *vehicle = (SWVehicle *)item;
    cell.textLabel.text = vehicle.name;
    cell.detailTextLabel.text = vehicle.model;
}

@end
