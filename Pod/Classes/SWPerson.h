//
//  SWPerson.h
//  Pods
//
//  Created by Niels de Hoog on 29/12/14.
//
//

#import "SWModel.h"

@interface SWPerson : SWModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthYear;
@property (nonatomic, copy) NSString *eyeColor;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *hairColor;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *mass;
@property (nonatomic, copy) NSString *skinColor;

@property (nonatomic, copy) NSString *homeworld;
@property (nonatomic, copy) NSArray *films;
@property (nonatomic, copy) NSArray *species;
@property (nonatomic, copy) NSArray *starships;
@property (nonatomic, copy) NSArray *vehicles;

- (void)getHomeworldWithCompletion:(SWCompletionBlock)completion;
- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
- (void)getSpeciesWithCompletion:(SWCompletionBlock)completion;
- (void)getStarshipsWithCompletion:(SWCompletionBlock)completion;
- (void)getVehiclesWithCompletion:(SWCompletionBlock)completion;

@end
