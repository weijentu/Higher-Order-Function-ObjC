//
//  NSArray+HOFC.h
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-25.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOFC)

- (NSArray *)map:(id (^)(id obj))block
           class:(Class)aClass;
- (NSArray *)filter:(BOOL (^)(id obj))block
              class:(Class)aClass;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block
       class:(Class)aClass;
- (NSArray *)flatMap:(id (^)(id obj))block
               class:(Class)aClass;
- (BOOL)contains:(BOOL (^)(id obj))block
           class:(Class)aClass;
- (void)forEach:(void (^)(id obj))block
          class:(Class)aClass;

@end
