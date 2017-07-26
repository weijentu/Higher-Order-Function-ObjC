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
    NSLog(@"%@", [array reduce:@"Hey, " block:^id(id obj1 ,id obj2) { return [NSString stringWithFormat:@"%@%@", obj1, obj2]; }]);
    
    // Contains: Iterate an array and chekc if any element satisfies a condition.
    NSLog(@"%@", [array contains:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"H"]; }] ? @"YES" : @"NO");
    
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
    NSLog(@"%@", [array reduce:@"Hey, " block:^id(id obj1 ,id obj2) { return [NSString stringWithFormat:@"%@%@", obj1, obj2]; } class:[NSString class]]);
    
    // Contains: Iterate an array and chekc if any element satisfies a condition.
    NSLog(@"%@", [array contains:^BOOL(id obj) { return [(NSString *)obj isEqualToString:@"H"]; } class:[NSString class]] ? @"YES" : @"NO");
    
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
