//
//  SWAPI.m
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWAPI.h"

@implementation SWAPI

// FIXME: this stuff should only exist in SWQuery

static NSString *const kSWAPIBaseURL = @"http://swapi.co/api/";

#pragma mark - Private methods

+ (NSURL *)baseURL
{
    return [NSURL URLWithString:kSWAPIBaseURL];
}

+ (NSURLSession *)URLsession
{
    return [NSURLSession sharedSession];
}

+ (NSURLSessionDataTask *)getPath:(NSString *)path completion:(SWCompletionBlock)completion
{
    NSURL *URL = [NSURL URLWithString:path relativeToURL:[self baseURL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *task = [[self URLsession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id responseObject = nil;
        if (!error) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        }
        
        if (completion) {
            completion(responseObject, error);
        }
    }];
    
    [task resume];
    
    return task;
}

+ (NSURLSessionDataTask *)getURL:(NSURL *)URL completion:(SWCompletionBlock)completion
{
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *task = [[self URLsession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id responseObject = nil;
        if (!error) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        }
        
        if (completion) {
            completion(responseObject, error);
        }
    }];
    
    [task resume];
    
    return task;
}

+ (void)performQuery:(SWQuery *)query completion:(SWCompletionBlock)completion
{
    [self getURL:query.URL completion:^(id result, NSError *error) {
        
        BOOL finished = YES;
        if (!error) {
            
            if (query.isCollection) {
                NSArray *items = [MTLJSONAdapter modelsOfClass:query.modelClass fromJSONArray:result[@"results"] error:&error];
                [query.result addItems:items];
            }
            else {
                id item = [MTLJSONAdapter modelOfClass:query.modelClass fromJSONDictionary:result error:&error];
                [query.result addItem:item];
            }
            
            if (query.isCollection) {
                NSString *nextURLString = result[@"next"];
                if (nextURLString && ![nextURLString isKindOfClass:[NSNull class]]) {
                    NSLog(@"next url string: %@", nextURLString);
                    finished = NO;
                    SWQuery *nextQuery = [SWQuery queryForURLString:nextURLString modelClass:query.modelClass];
                    nextQuery.result = query.result;
                    nextQuery.collection = YES;
                    [self performQuery:nextQuery completion:completion];
                }
            }
        }
        
        if (finished && completion) {
            completion(query.result, error);
        }
    }];
}

+ (void)performQueriesInSet:(SWQuerySet *)querySet completion:(SWCompletionBlock)completion;
{
    dispatch_group_t group = dispatch_group_create();
    
    SWResultSet *resultSet = [[SWResultSet alloc] init];
    __block NSError *requestError = nil;
    
    for (SWQuery *query in querySet.queries) {
        dispatch_group_enter(group);
        [self performQuery:query completion:^(SWResultSet *result, NSError *error) {
            dispatch_group_leave(group);
            if (!error) {
                [resultSet addItems:result.items];
            }
            else {
                requestError = error;
            }
        }];
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (completion) {
            completion(resultSet, requestError);
        }
    });
}

#pragma mark - Collections

+ (void)getPeopleWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"people" modelClass:[SWPerson class]];
    [self performQuery:query completion:completion];
}

+ (NSURLSessionDataTask *)getStarshipsWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"starships" completion:completion];
}

+ (NSURLSessionDataTask *)getPlanetsWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"planets" completion:completion];
}

+ (NSURLSessionDataTask *)getVehiclesWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"vehicles" completion:completion];
}

+ (NSURLSessionDataTask *)getSpeciesWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"species" completion:completion];
}

+ (NSURLSessionDataTask *)getFilmsWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"films" completion:completion];
}

#pragma mark - Individual resources

+ (void)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"people/%@", ID] modelClass:[SWPerson class]];
    [self performQuery:query completion:completion];
}

//+ (void)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion
//{
//    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"starships/%@", ID] modelClass:[SWPerson class]];
//    [self performQuery:query completion:completion];
//}

@end
