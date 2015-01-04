//
//  SWQuerySet.m
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import "SWQuerySet.h"
#import "SWQuery.h"

@implementation SWQuerySet

+ (instancetype)querySetWithURLStrings:(NSArray *)URLStrings modelClass:(Class)modelClass
{
    return [[self alloc] initWithURLStrings:URLStrings modelClass:modelClass];
}

- (instancetype)initWithURLStrings:(NSArray *)URLStrings modelClass:(Class)modelClass
{
    self = [super init];
    if (self) {
        NSMutableArray *queries = [[NSMutableArray alloc] init];
        for (NSString *URLString in URLStrings) {
            SWQuery *query = [SWQuery queryForURLString:URLString modelClass:modelClass];
            [queries addObject:query];
        }
        _queries = [queries copy];
    }
    return self;
}

@end
