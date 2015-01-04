//
//  SWQuery.h
//  Pods
//
//  Created by Niels de Hoog on 31/12/14.
//
//

#import <Foundation/Foundation.h>
#import "SWResultSet.h"

@interface SWQuery : NSObject

@property (nonatomic, readonly) NSURL *URL;
@property (nonatomic, readonly) Class modelClass;
@property (nonatomic, getter=isCollection) BOOL collection;

@property (nonatomic, strong) SWResultSet *result;

+ (instancetype)queryForObjectWithPath:(NSString *)path modelClass:(Class)modelClass;
+ (instancetype)queryForCollectionWithPath:(NSString *)path modelClass:(Class)modelClass;

+ (instancetype)queryForURLString:(NSString *)URLString modelClass:(Class)modelClass;

@end
