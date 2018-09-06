//
//  CZDShoeProvider.m
//  CZDProxyDemo
//
//  Created by Czd on 2018/9/6.
//  Copyright © 2018年 Czd. All rights reserved.
//

#import "CZDShoeProvider.h"

@implementation CZDShoeProvider

- (void)buyShoeWithSize:(NSNumber *)size
{
    switch (size.integerValue) {
        case 1:
            NSLog(@"买小鞋");
            break;
        case 2:
            NSLog(@"买中鞋");
            break;
        case 3:
            NSLog(@"买大鞋");
            break;
            
        default:
            break;
    }
}

@end
