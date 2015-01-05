//
//  SWFilm.m
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import "SWFilm.h"

// Helpers
#import "SWAPI.h"

@implementation SWFilm

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{  @"title": @"title",
                                 @"episodeID": @"episode_id",
                                 @"openingCrawl": @"opening_crawl",
                                 @"director": @"director",
                                 @"producer": @"producer",
                                 @"species": @"species",
                                 @"starships": @"starships",
                                 @"vehicles": @"vehicles",
                                 @"characters": @"characters",
                                 @"planets": @"planets"  };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - Relationships

- (void)getSpeciesWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.species modelClass:[SWSpecies class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getStarshipsWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.starships modelClass:[SWStarship class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getVehiclesWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.vehicles modelClass:[SWVehicle class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getCharactersWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.characters modelClass:[SWPerson class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getPlanetsWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.planets modelClass:[SWPlanet class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

@end
