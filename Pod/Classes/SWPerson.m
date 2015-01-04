//
//  SWPerson.m
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWPerson.h"
#import "SWAPI.h"

@implementation SWPerson

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"name": @"name",
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
             @"vehicles": @"vehicles",
             @"URLString": @"url",
             @"createdDate": @"created",
             @"editedDate": @"edited"};
}

#pragma mark - Relationships

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion
{
    SWQuerySet *querySet = [SWQuerySet querySetWithURLStrings:self.films modelClass:[SWFilm class]];
    [SWAPI performQueriesInSet:querySet completion:completion];
}

@end
