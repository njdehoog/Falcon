//
//  SWPerson.m
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWPerson.h"

// Helpers
#import "SWAPI.h"

@implementation SWPerson

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths =  @{ @"name": @"name",
                                 @"birthYear": @"birth_year",
                                 @"eyeColor": @"eye_color",
                                 @"gender": @"gender",
                                 @"hairColor": @"hair_color",
                                 @"height": @"height",
                                 @"mass": @"mass",
                                 @"skinColor": @"skin_color",
                                 @"homeworld": @"homeworld",
                                 @"films": @"films",
                                 @"species": @"species",
                                 @"starships": @"starships",
                                 @"vehicles": @"vehicles" };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - Relationships

- (void)getHomeworldWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:@[self.homeworld] modelClass:[SWPlanet class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.films modelClass:[SWFilm class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

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

@end
