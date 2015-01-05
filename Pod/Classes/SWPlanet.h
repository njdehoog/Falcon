//
//  SWPlanet.h
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWModel.h"

@interface SWPlanet : SWModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *diameter;
@property (nonatomic, copy) NSString *rotationPeriod;
@property (nonatomic, copy) NSString *orbitalPeriod;
@property (nonatomic, copy) NSString *gravity;
@property (nonatomic, copy) NSString *population;
@property (nonatomic, copy) NSString *climate;
@property (nonatomic, copy) NSString *terrain;
@property (nonatomic, copy) NSString *surfaceWater;

@property (nonatomic, copy) NSArray *residents;
@property (nonatomic, copy) NSArray *films;

- (void)getResidentsWithCompletion:(SWCompletionBlock)completion;
- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;

@end
