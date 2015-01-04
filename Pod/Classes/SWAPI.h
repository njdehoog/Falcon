//
//  SWAPI.h
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import <Foundation/Foundation.h>

// Defines
#import "SWDefines.h"

// Model
#import "SWPerson.h"
#import "SWFilm.h"

// Helpers
#import "SWQuery.h"
#import "SWQuerySet.h"
#import "SWResultSet.h"

@interface SWAPI : NSObject

///-------------------------------------------------
/// @name Group resources
///-------------------------------------------------

+ (void)getPeopleWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getStarshipsWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getPlanetsWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getVehiclesWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getSpeciesWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getFilmsWithCompletion:(SWCompletionBlock)completion;

///-------------------------------------------------
/// @name Individual resources
///-------------------------------------------------

+ (void)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
//+ (void)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion;


///-------------------------------------------------
/// @name Helpers
///-------------------------------------------------

+ (void)performQuery:(SWQuery *)query completion:(SWCompletionBlock)completion;
+ (void)performQueriesInSet:(SWQuerySet *)querySet completion:(SWCompletionBlock)completion;

@end
