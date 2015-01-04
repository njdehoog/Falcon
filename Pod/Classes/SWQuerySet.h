//
//  SWQuerySet.h
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import <Foundation/Foundation.h>

@interface SWQuerySet : NSObject

@property (nonatomic, readonly) NSArray *queries;

+ (instancetype)querySetWithURLStrings:(NSArray *)URLStrings modelClass:(Class)modelClass;

@end
