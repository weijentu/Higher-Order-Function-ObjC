//
//  NSArray+HOFC.m
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-25.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import "NSArray+HOFC.h"

@implementation NSArray (HOFC)

#pragma mark - Map, filter, reduce, flatMap function with class restrictor
- (NSArray *)map:(id (^)(id obj))block
           class:(Class)aClass {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass]) {
            [mutableArray addObject:block(obj)];
        }
    }];
    return mutableArray;
}

- (NSArray *)filter:(BOOL (^)(id obj))block
              class:(Class)aClass {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass] &&
            block(obj) == YES) {
            [mutableArray addObject:obj];
        }
    }];
    return mutableArray;
}

- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block
       class:(Class)aClass {
    __block id obj = initial;
    [self enumerateObjectsUsingBlock:^(id _obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:aClass] &&
            [_obj isKindOfClass:aClass]) {
            obj = block(obj, _obj);
        }
    }];
    return obj;
}

- (NSArray *)flatMap:(id (^)(id obj))block
               class:(Class)aClass {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id _obj = block(obj);
        if ([_obj isKindOfClass:[NSArray class]]) {
            NSArray *_array = [_obj flatMap:block
                                      class:aClass];
            [mutableArray addObjectsFromArray:_array];
            return;
        }
        
        if ([_obj isKindOfClass:aClass]) {
            [mutableArray addObject:_obj];
        }
    }];
    return mutableArray;
}

- (BOOL)contains:(BOOL (^)(id obj))block
           class:(Class)aClass {
    __block BOOL contains = NO;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:aClass]) {
            return;
        }
        
        if (block(obj) == YES) {
            contains = YES;
            *stop = YES;
        }
    }];
    return contains;
}

- (void)forEach:(void (^)(id obj))block
          class:(Class)aClass {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:aClass]) {
            return;
        }
        block(obj);
    }];
}

@end
