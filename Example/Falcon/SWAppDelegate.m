//
//  SWAppDelegate.m
//  Falcon
//
//  Created by CocoaPods on 12/29/2014.
//  Copyright (c) 2014 Niels de Hoog. All rights reserved.
//

#import "SWAppDelegate.h"

#import "SWAPI.h"

@implementation SWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    [SWAPI getPeopleWithCompletion:^(SWResultSet *result, NSError *error) {
//        if (error) {
//            NSLog(@"Error getting people: %@", error);
//        }
//        else {
//            NSLog(@"%ld people", [result.items count]);
//        }
//    }];
    
    [SWAPI getPersonWithID:@"1" completion:^(SWResultSet *result, NSError *error) {
        if (error) {
            NSLog(@"Error getting person: %@", error);
        }
        else {
            NSLog(@"person: %@", [result.items firstObject]);
            
            SWPerson *person = [result.items firstObject];
            [person getFilmsWithCompletion:^(SWResultSet *result, NSError *error) {
                if (error) {
                    NSLog(@"Error getting person: %@", error);
                }
                else {
                    NSLog(@"films: %@", result.items);
                }
            }];
        }
    }];
    
    return YES;
}
                        

@end
