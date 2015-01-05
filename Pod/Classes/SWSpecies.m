//
//  SWSpecies.m
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWSpecies.h"

// Helpers
#import "SWAPI.h"

@implementation SWSpecies

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths =  @{ @"name": @"name",
                                 @"classification": @"classification",
                                 @"designation": @"designation",
                                 @"averageHeight": @"average_height",
                                 @"averageLifespan": @"average_lifespan",
                                 @"eyeColors": @"eye_colors",
                                 @"hairColors": @"hair_colors",
                                 @"skinColors": @"skin_colors",
                                 @"language": @"language",
                                 @"homeworld": @"homeworld",
                                 @"people": @"people",
                                 @"films": @"films" };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - Relationships

- (void)getHomeworldWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:@[self.homeworld] modelClass:[SWPlanet class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getPeopleWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.people modelClass:[SWPerson class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.films modelClass:[SWFilm class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

@end
