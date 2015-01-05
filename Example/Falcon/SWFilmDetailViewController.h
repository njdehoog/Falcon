//
//  SWFilmDetailViewController.h
//  Falcon
//
//  Created by Niels de Hoog on 05/01/15.
//  Copyright (c) 2015 Niels de Hoog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWFilmDetailViewController : UITableViewController

@property (nonatomic, strong) SWFilm *film;
@property (nonatomic, strong) NSArray *items;

- (void)configureCell:(UITableViewCell *)cell withItem:(SWModel *)item;

@end
