//
//  CZDShoeProvider.h
//  CZDProxyDemo
//
//  Created by Czd on 2018/9/6.
//  Copyright © 2018年 Czd. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, TDShoeSize){
    TDShoeSizeSmall = 1,
    TDShoeSizeMedium,
    TDShoeSizeBig
};


@interface CZDShoeProvider : NSObject

- (void)buyShoeWithSize:(NSNumber *)size;

@end
