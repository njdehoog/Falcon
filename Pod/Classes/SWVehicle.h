//
//  SWVehicle.h
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWModel.h"

@interface SWVehicle : SWModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *vehicleClass;
@property (nonatomic, copy) NSString *manufacturer;
@property (nonatomic, copy) NSString *costInCredits;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *crew;
@property (nonatomic, copy) NSString *passengers;
@property (nonatomic, copy) NSString *maxAtmospheringSpeed;
@property (nonatomic, copy) NSString *cargoCapacity;
@property (nonatomic, copy) NSString *consumables;

@property (nonatomic, copy) NSArray *films;
@property (nonatomic, copy) NSArray *pilots;

- (void)getFilmsWithCompletion:(SWCompletionBlock)completion;
- (void)getPilotsWithCompletion:(SWCompletionBlock)completion;

@end
