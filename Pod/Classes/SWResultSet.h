//
//  SWResultSet.h
//  Pods
//
//  Created by Niels de Hoog on 31/12/14.
//
//

#import <Foundation/Foundation.h>

@interface SWResultSet : NSObject

@property (nonatomic, readonly) NSArray *items;

- (void)addItem:(id)item;
- (void)addItems:(NSArray *)items;

@end
