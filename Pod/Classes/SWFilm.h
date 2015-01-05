//
//  SWFilm.h
//  Pods
//
//  Created by Niels de Hoog on 04/01/15.
//
//

#import "SWModel.h"

@interface SWFilm : SWModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *episodeID;
@property (nonatomic, copy) NSString *openingCrawl;
@property (nonatomic, copy) NSString *director;
@property (nonatomic, copy) NSString *producer;

@property (nonatomic, copy) NSArray *species;
@property (nonatomic, copy) NSArray *starships;
@property (nonatomic, copy) NSArray *vehicles;
@property (nonatomic, copy) NSArray *characters;
@property (nonatomic, copy) NSArray *planets;

- (void)getSpeciesWithCompletion:(SWCompletionBlock)completion;
- (void)getStarshipsWithCompletion:(SWCompletionBlock)completion;
- (void)getVehiclesWithCompletion:(SWCompletionBlock)completion;
- (void)getCharactersWithCompletion:(SWCompletionBlock)completion;
- (void)getPlanetsWithCompletion:(SWCompletionBlock)completion;

@end
