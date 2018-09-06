//
//  CZDProxy.m
//  CZDProxyDemo
//
//  Created by Czd on 2018/9/6.
//  Copyright © 2018年 Czd. All rights reserved.
//

#import "CZDProxy.h"


#import <objc/runtime.h>

@interface CZDProxy ()
{
    CZDAppleProvider *_appleProvider;
    CZDShoeProvider *_shoeProvider;
    NSMutableDictionary *_methodsMap;
}

@end

@implementation CZDProxy

#pragma mark - class method


+ (instancetype)czdProxy
{
    return [[CZDProxy alloc]init];
}

#pragma mark - private method


- (instancetype)init
{
    _methodsMap = [NSMutableDictionary dictionary];
    _appleProvider = [[CZDAppleProvider alloc]init];
    _shoeProvider = [[CZDShoeProvider alloc]init];
    [self _registerMethodsWithtarget:_appleProvider];
    [self _registerMethodsWithtarget:_shoeProvider];
    return self;
}

- (void)_registerMethodsWithtarget:(id)target
{
    unsigned int numberOfMethods = 0;
    Method *method_list = class_copyMethodList([target class], &numberOfMethods);
    for (int i = 0; i < numberOfMethods; i ++) {
        //获取方法名存入字典 为了寻找对应的target
        Method temp_method = method_list[i];
        SEL temp_sel = method_getName(temp_method);
        const char * temp_method_name = sel_getName(temp_sel);
        [_methodsMap setObject:target forKey:[NSString stringWithUTF8String:temp_method_name]];
    }
    free(method_list);
}

#pragma mark - NSProxy override methods

- (void)forwardInvocation:(NSInvocation *)invocation{
    //获取当前选择子
    SEL sel = invocation.selector;
    
    //获取选择子方法名
    NSString *methodName = NSStringFromSelector(sel);
    
    //在字典中查找对应的target
    id target = _methodsMap[methodName];
    
    //检查target
    if (target && [target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    } else {
        [super forwardInvocation:invocation];
    }
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    //获取选择子方法名
    NSString *methodName = NSStringFromSelector(sel);
    
    //在字典中查找对应的target
    id target = _methodsMap[methodName];
    
    //检查target
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}






@end
