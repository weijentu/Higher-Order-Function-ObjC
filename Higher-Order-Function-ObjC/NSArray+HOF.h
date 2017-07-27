//
//  NSArray+HOF.h
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-24.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOF)

- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
- (BOOL)contains:(BOOL (^)(id obj))block;
- (void)forEach:(void (^)(id obj))block;

@end
