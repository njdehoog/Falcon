//
//  SWResultSet.m
//  Pods
//
//  Created by Niels de Hoog on 31/12/14.
//
//

#import "SWResultSet.h"

@interface SWResultSet ()

@property (nonatomic, strong) NSMutableArray *mutableItems;

@end

@implementation SWResultSet

- (void)addItem:(id)item
{
    [self.mutableItems addObject:item];
}

- (void)addItems:(NSArray *)items
{
    [self.mutableItems addObjectsFromArray:items];
}

- (NSArray *)items
{
    return [self.mutableItems copy];
}

- (NSMutableArray *)mutableItems
{
    if (!_mutableItems) {
        _mutableItems = [[NSMutableArray alloc] init];
    }
    
    return _mutableItems;
}

@end
