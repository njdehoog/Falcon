//
//  SWVehicle.m
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWVehicle.h"

// Helpers
#import "SWAPI.h"

@implementation SWVehicle

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths =  @{ @"name": @"name",
                                 @"model": @"model",
                                 @"vehicleClass": @"vehicle_class",
                                 @"manufacturer": @"manufacturer",
                                 @"costInCredits": @"cost_in_credits",
                                 @"length": @"length",
                                 @"crew": @"crew",
                                 @"passengers": @"passengers",
                                 @"maxAtmospheringSpeed": @"max_atmosphering_speed",
                                 @"cargoCapacity": @"cargo_capacity",
                                 @"consumables": @"consumables",
                                 @"films": @"films",
                                 @"pilots": @"pilots" };
    
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:keyPaths];
}

#pragma mark - Relationships

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.films modelClass:[SWFilm class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

- (void)getPilotsWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.pilots modelClass:[SWPerson class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

@end
