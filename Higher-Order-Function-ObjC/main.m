//
//  main.m
//  Higher-Order-Function-ObjC
//
//  Created by WEI-JEN TU on 2017-07-24.
//  Copyright © 2017 Cold Yam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExampleUsages.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [ExampleUsages withoutClassRestrictor];
        [ExampleUsages withClassRestrictor];
    }
    
    return 0;
}
