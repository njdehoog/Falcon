//
//  SWAPI.m
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWAPI.h"

@implementation SWAPI

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

#pragma mark - Public methods

+ (NSURLSessionDataTask *)getPeopleWithCompletion:(SWCompletionBlock)completion
{
    return [self getPath:@"people" completion:completion];
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

+ (NSURLSessionDataTask *)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    return [self getPath:[NSString stringWithFormat:@"people/%@", ID] completion:completion];
}

+ (NSURLSessionDataTask *)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion
{
    return [self getPath:[NSString stringWithFormat:@"starships/%@", ID] completion:completion];
}

@end
