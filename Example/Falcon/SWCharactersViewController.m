//
//  SWCharactersViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWCharactersViewController.h"

@implementation SWCharactersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [self.film getCharactersWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];
        
        self.items = result.items;
        [self.tableView reloadData];
    }];
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    SWPerson *person = (SWPerson *)item;
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.birthYear;
}

@end
