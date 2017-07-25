//
//  NSArray+HOF.h
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-24.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extensions)

- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id (^)(id obj0, id obj1))block;
- (NSArray *)flatMap:(id (^)(id obj))block;

@end
