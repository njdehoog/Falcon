//
//  SWFilm.h
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import "Mantle.h"

@interface SWFilm : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *episodeID;
@property (nonatomic, copy) NSString *openingCrawl;
@property (nonatomic, copy) NSString *director;
@property (nonatomic, copy) NSString *producer;

@property (nonatomic, copy) NSArray *species;
@property (nonatomic, copy) NSArray *starships;
@property (nonatomic, copy) NSArray *vehicles;
@property (nonatomic, copy) NSArray *people;
@property (nonatomic, copy) NSArray *planets;

@property (nonatomic, copy) NSString *URL;

@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, copy) NSDate *createdDate;
@property (nonatomic, copy) NSDate *editedDate;

@end
