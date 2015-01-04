//
//  SWQuery.m
//  Pods
//
//  Created by Niels de Hoog on 31/12/14.
//
//

#import "SWQuery.h"

@interface SWQuery ()

@property (nonatomic) Class modelClass;
@property (nonatomic, strong) NSURL *URL;

@end

@implementation SWQuery

#pragma mark - URL

static NSString *const kSWAPIBaseURL = @"http://swapi.co/api/";

+ (NSURL *)baseURL
{
    return [NSURL URLWithString:kSWAPIBaseURL];
}

#pragma mark - Convenience constructors

+ (instancetype)queryForCollectionWithPath:(NSString *)path modelClass:(Class)modelClass
{
    SWQuery *query = [[self alloc] initWithPath:path modelClass:modelClass];
    query.collection = YES;
    return query;
}

+ (instancetype)queryForObjectWithPath:(NSString *)path modelClass:(Class)modelClass
{
    return [[self alloc] initWithPath:path modelClass:modelClass];
}

+ (instancetype)queryForURLString:(NSString *)URLString modelClass:(Class)modelClass
{
    return [[self alloc] initWithURLString:URLString modelClass:modelClass];
}

#pragma mark - Initializers

- (instancetype)initWithPath:(NSString *)path modelClass:(Class)modelClass
{
    self = [super init];
    if (self) {
        _URL = [NSURL URLWithString:path relativeToURL:[[self class] baseURL]];
        _modelClass = modelClass;
    }
    
    return self;
}

- (instancetype)initWithURLString:(NSString *)URLString modelClass:(Class)modelClass
{
    self = [super init];
    if (self) {
        _URL = [NSURL URLWithString:URLString];
        _modelClass = modelClass;
    }
    
    return self;
}

#pragma mark - Results

- (SWResultSet *)result
{
    if (!_result) {
        _result = [[SWResultSet alloc] init];
    }
    
    return _result;
}

@end
