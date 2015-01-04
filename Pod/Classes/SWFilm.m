//
//  SWFilm.m
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import "SWFilm.h"

@implementation SWFilm

#pragma mark - MTLModelJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"title": @"title",
             @"episodeID": @"episode_id",
             @"openingCrawl": @"opening_crawl",
             @"director": @"director",
             @"producer": @"producer",
             @"species": @"species",
             @"starships": @"starships",
             @"vehicles": @"vehicles",
             @"people": @"characters",
             @"planets": @"planets",
             @"URLString": @"url",
             @"URL": @"url",
             @"createdDate": @"created",
             @"editedDate": @"edited"};
}

@end
