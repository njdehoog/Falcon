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
#import "SWStarship.h"
#import "SWPlanet.h"
#import "SWVehicle.h"
#import "SWSpecies.h"

// Helpers
#import "SWQuery.h"
#import "SWQuerySet.h"
#import "SWResultSet.h"

@interface SWAPI : NSObject

///-------------------------------------------------
/// @name Group resources
///-------------------------------------------------

+ (void)getPeopleWithCompletion:(SWCompletionBlock)completion;
+ (void)getStarshipsWithCompletion:(SWCompletionBlock)completion;
+ (void)getPlanetsWithCompletion:(SWCompletionBlock)completion;
+ (void)getVehiclesWithCompletion:(SWCompletionBlock)completion;
+ (void)getSpeciesWithCompletion:(SWCompletionBlock)completion;
+ (void)getFilmsWithCompletion:(SWCompletionBlock)completion;

///-------------------------------------------------
/// @name Individual resources
///-------------------------------------------------

+ (void)getPersonWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (void)getStarshipWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (void)getPlanetWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (void)getVehicleWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (void)getSpeciesWithID:(NSString *)ID completion:(SWCompletionBlock)completion;
+ (void)getFilmWithID:(NSString *)ID completion:(SWCompletionBlock)completion;

///-------------------------------------------------
/// @name Helpers
///-------------------------------------------------

+ (void)performQuery:(SWQuery *)query completion:(SWCompletionBlock)completion;
+ (void)performQueriesInSet:(SWQuerySet *)querySet completion:(SWCompletionBlock)completion;

@end
