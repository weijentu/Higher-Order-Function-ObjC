//
//  main.m
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-24.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+HOF.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
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
        // FlatMap: Flattens an array of arrays.
        NSLog(@"%@", [array flatMap:^id(id obj) { return obj; } class:[NSString class]]);
    }
    
    return 0;
}
