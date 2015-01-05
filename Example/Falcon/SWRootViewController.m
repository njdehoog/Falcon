//
//  SWViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 12/29/2014.
//  Copyright (c) 2014 Niels de Hoog. All rights reserved.
//

#import "SWRootViewController.h"

// View controllers
#import "SWFilmViewController.h"

@interface SWRootViewController ()

@property (nonatomic, strong) NSArray *films;

@end

@implementation SWRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view animated:YES];
    
    [SWAPI getFilmsWithCompletion:^(SWResultSet *result, NSError *error) {
        [MRProgressOverlayView dismissOverlayForView:self.navigationController.view animated:YES];
        
        self.films = result.items;
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.films count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *__cellIdentifier = @"FilmCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:__cellIdentifier];
    
    SWFilm *film = [self.films objectAtIndex:indexPath.row];
    cell.textLabel.text = film.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Episode %@", film.episodeID];
    
    return cell;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushFilmVC"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        
        SWFilmViewController *viewController = [segue destinationViewController];
        viewController.film = [self.films objectAtIndex:indexPath.row];
    }
}

@end
