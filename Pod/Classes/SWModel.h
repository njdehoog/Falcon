//
//  SWModel.h
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "Mantle.h"
#import "SWDefines.h"

@interface SWModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, copy) NSDate *createdDate;
@property (nonatomic, copy) NSDate *editedDate;

@end
