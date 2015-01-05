//
//  SWModel.m
//  Pods
//
//  Created by Niels de Hoog on 05/01/15.
//
//

#import "SWModel.h"

// Helpers
#import "ISO8601DateFormatter.h"

@implementation SWModel

+ (ISO8601DateFormatter *)dateFormatter
{
    static ISO8601DateFormatter *__dateFormatter = nil;
    if (!__dateFormatter) {
        __dateFormatter = [[ISO8601DateFormatter alloc] init];
    }
    
    return __dateFormatter;
}

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"URLString": @"url",
             @"createdDate": @"created",
             @"editedDate": @"edited"};
}

+ (NSValueTransformer *)createdDateJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *string) {
        return [[self dateFormatter] dateFromString:string];
    } reverseBlock:^(NSDate *date) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

+ (NSValueTransformer *)editedDateJSONTransformer
{
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *string) {
        return [[self dateFormatter] dateFromString:string];
    } reverseBlock:^(NSDate *date) {
        return [[self dateFormatter] stringFromDate:date];
    }];
}

@end
