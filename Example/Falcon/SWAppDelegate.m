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
    [SWAPI getPeopleWithCompletion:^(NSArray *results, NSError *error) {
        if (error) {
            NSLog(@"Error getting people: %@", error);
        }
        else {
            NSLog(@"people: %@", results);
        }
    }];
    
    [SWAPI getPersonWithID:@"1" completion:^(NSDictionary *result, NSError *error) {
        if (error) {
            NSLog(@"Error getting person: %@", error);
        }
        else {
            NSLog(@"person: %@", result);
        }
    }];
    
    return YES;
}
                        

@end
