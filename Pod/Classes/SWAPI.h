//
//  SWAPI.h
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import <Foundation/Foundation.h>

// Model
#import "SWPerson.h"

typedef void (^SWCompletionBlock)(id result, NSError *error);

@interface SWAPI : NSObject

///-------------------------------------------------
/// @name Group resources
///-------------------------------------------------

+ (NSURLSessionDataTask *)getPeopleWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getStarshipsWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getPlanetsWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getVehiclesWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getSpeciesWithCompletion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getFilmsWithCompletion:(SWCompletionBlock)completion;

///-------------------------------------------------
/// @name Individual resources
///-------------------------------------------------

+ (NSURLSessionDataTask *)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (NSURLSessionDataTask *)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion;


@end
