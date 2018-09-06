//
//  CZDProxy.h
//  CZDProxyDemo
//
//  Created by Czd on 2018/9/6.
//  Copyright © 2018年 Czd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CZDAppleProvider.h"
#import "CZDShoeProvider.h"

@interface CZDProxy : NSProxy


+ (instancetype)czdProxy;

@end
