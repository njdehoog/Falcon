//
//  SWPlanet.m
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWPlanet.h"

// Helpers
#import "SWAPI.h"

@implementation SWPlanet

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths =  @{ @"name": @"name",
                                 @"diameter": @"diameter",
                                 @"rotationPeriod": @"rotation_period",
                                 @"orbitalPeriod": @"orbital_period",
                                 @"gravity": @"gravity",
                                 @"population": @"population",
                                 @"climate": @"climate",
                                 @"terrain": @"terrain",
                                 @"surfaceWater": @"surface_water",
                                 @"residents": @"residents",
                                 @"films": @"films" };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - Relationships

- (void)getResidentsWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.residents modelClass:[SWPerson class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.films modelClass:[SWFilm class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

@end
