//
//  ExampleUsages.m
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-25.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import "ExampleUsages.h"
#import "NSArray+HOF.h"
#import "NSArray+HOFC.h"

@implementation ExampleUsages

#pragma mark -- Example 1: without class restrictor
+ (void)withoutClassRestrictor {
    
    NSArray *array = @[
                       @"H",
                       @"e",
                       @"l",
                       @"l",
                       @"o",
                       @",",
                       @" ",
                       @"w",
                       @"o",
                       @"r",
                       @"l",
                       @"d",
                       @"!"
                       ];
    
    // Map: Iterate an array and applies the same block operation to each element in it.
    NSLog(@"%@", [array map:^id(id obj) { return [(NSString *)obj uppercaseString]; }]);
    
    // Filter: Iterate an array and return elements that meet a condition.
    NSLog(@"%@", [array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; }]);
    
    // Reduce: Combine all elements in an array to create a single output.
    NSLog(@"%@", [array reduce:@"Hey, " block:^id(id obj ,id _obj) { return [NSString stringWithFormat:@"%@%@", obj, _obj]; }]);
    array = @[
              @[@"H", @"e", @"l", @"l", @"o"],
              @[@",", @" "],
              @[@"w", @"o", @"r", @"l", @"d", @"!"]
              ];
    // FlatMap: Flatten an array of arrays.
    NSLog(@"%@", [array flatMap:^id(id obj) { return obj; }]);

}

#pragma mark -- Example 2: with class restrictor
+ (void)withClassRestrictor {

    NSArray *array = @[
                       @"H",
                       @"e",
                       @"l",
                       @"l",
                       @"o",
                       @",",
                       @" ",
                       @"w",
                       @3,
                       @"o",
                       @"r",
                       @"l",
                       @"d",
                       @"!"
                       ];
    
    // Map: Iterate an array and applies the same block operation to each element in it.
    NSLog(@"%@", [array map:^id(id obj) { return [(NSString *)obj uppercaseString]; } class:[NSString class]]);
    
    // Filter: Iterate an array and return elements that meet a condition.
    NSLog(@"%@", [array filter:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"o"]; } class:[NSString class]]);
    
    // Reduce: Combine all elements in an array to create a single output.
    NSLog(@"%@", [array reduce:@"Hey, " block:^id(id obj ,id _obj) { return [NSString stringWithFormat:@"%@%@", obj, _obj]; } class:[NSString class]]);
    array = @[
              @[@"H", @"e", @"l", @"l", @"o"],
              @[@",", @" ", @3],
              @[@6, @8, @6],
              @[@"w", @"o", @"r", @"l", @"d", @"!"]
              ];
    // FlatMap: Flatten an array of arrays.
    NSLog(@"%@", [array flatMap:^id(id obj) { return obj; } class:[NSString class]]);
    
}

@end
