//
//  SWAPI.m
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWAPI.h"

@implementation SWAPI

#pragma mark - Collections

+ (void)getPeopleWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"people" modelClass:[SWPerson class]];
    [self performQuery:query completion:completion];
}

+ (void)getStarshipsWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"starships" modelClass:[SWStarship class]];
    [self performQuery:query completion:completion];
}

+ (void)getPlanetsWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"planets" modelClass:[SWPlanet class]];
    [self performQuery:query completion:completion];
}

+ (void)getVehiclesWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"vehicles" modelClass:[SWVehicle class]];
    [self performQuery:query completion:completion];
}

+ (void)getSpeciesWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"species" modelClass:[SWSpecies class]];
    [self performQuery:query completion:completion];
}

+ (void)getFilmsWithCompletion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForCollectionWithPath:@"films" modelClass:[SWFilm class]];
    [self performQuery:query completion:completion];
}

#pragma mark - Individual resources

+ (void)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"people/%@", ID] modelClass:[SWPerson class]];
    [self performQuery:query completion:completion];
}

+ (void)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"starships/%@", ID] modelClass:[SWStarship class]];
    [self performQuery:query completion:completion];
}

+ (void)getPlanetWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"planets/%@", ID] modelClass:[SWPlanet class]];
    [self performQuery:query completion:completion];
}

+ (void)getVehicleWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"vehicles/%@", ID] modelClass:[SWVehicle class]];
    [self performQuery:query completion:completion];
}

+ (void)getSpeciesWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"species/%@", ID] modelClass:[SWSpecies class]];
    [self performQuery:query completion:completion];
}

+ (void)getFilmWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    SWQuery *query = [SWQuery queryForObjectWithPath:[NSString stringWithFormat:@"films/%@", ID] modelClass:[SWFilm class]];
    [self performQuery:query completion:completion];
}

#pragma mark - Helper methods

+ (NSURLSession *)URLsession
{
    return [NSURLSession sharedSession];
}

+ (NSIndexSet *)acceptableStatusCodes
{
    return [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(200, 100)];
}

+ (NSURLSessionDataTask *)getURL:(NSURL *)URL completion:(SWCompletionBlock)completion
{
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *task = [[self URLsession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        id responseObject = nil;
        if (!error && data) {
            responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        }
        
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (![[self acceptableStatusCodes] containsIndex:statusCode]) {
            NSDictionary *userInfo = @{
                                       NSLocalizedDescriptionKey: [NSString stringWithFormat:@"Request failed with status code %ld: %@", statusCode, [NSHTTPURLResponse localizedStringForStatusCode:statusCode]],
                                       NSURLErrorFailingURLErrorKey: [response URL]
                                       };
            
            error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorBadServerResponse userInfo:userInfo];
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

@end
