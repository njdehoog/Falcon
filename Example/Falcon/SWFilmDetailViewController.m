//
//  SWFilmDetailViewController.m
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import "SWFilmDetailViewController.h"

@implementation SWFilmDetailViewController

#pragma mark - UITableView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *__cellIdentifier = @"DetailCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:__cellIdentifier];
    
    SWModel *item = [self.items objectAtIndex:indexPath.row];
    [self configureCell:cell withItem:item];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item
{
    // Implemented in subclass
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
