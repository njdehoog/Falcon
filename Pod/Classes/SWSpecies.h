//
//  SWSpecies.h
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWModel.h"

@interface SWSpecies : SWModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *classification;
@property (nonatomic, copy) NSString *designation;
@property (nonatomic, copy) NSString *averageHeight;
@property (nonatomic, copy) NSString *averageLifespan;
@property (nonatomic, copy) NSString *eyeColors;
@property (nonatomic, copy) NSString *hairColors;
@property (nonatomic, copy) NSString *skinColors;
@property (nonatomic, copy) NSString *language;

@property (nonatomic, copy) NSString *homeworld;
@property (nonatomic, copy) NSArray *people;
@property (nonatomic, copy) NSArray *films;

- (void)getHomeworldWithCompletion:(SWCompletionBlock)completion;
- (void)getPeopleWithCompletion:(SWCompletionBlock)completion;
- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;

@end
