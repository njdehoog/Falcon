//
//  SWFilmViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWFilmViewController.h"

// View controllers
#import "SWFilmDetailViewController.h"

@implementation SWFilmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.film.title;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SWFilmDetailViewController *viewController = [segue destinationViewController];
    viewController.film = self.film;
}

@end
