//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  LikechuxingDylib.m
//  LikechuxingDylib
//
//  Created by xiaolin on 2018/6/13.
//  Copyright (c) 2018年 xiaolin. All rights reserved.
//

#import "LikechuxingDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <MDCycriptManager.h>
#import "EncryptHooker.h"


CHDeclareClass(AFHTTPRequestSerializer)
CHMethod4(id, AFHTTPRequestSerializer, requestWithMethod, id, method, URLString, id, URLString, parameters, id, parameters, error, NSError * _Nullable __autoreleasing *_Nullable , error) {
    
    NSLog(@"requestWithMethod url:%@  params:%@", URLString, parameters);
    
    return CHSuper4(AFHTTPRequestSerializer, requestWithMethod, method, URLString, URLString, parameters, nil, error, error);
}

CHDeclareClass(AFHTTPSessionManager)
CHMethod5(id, AFHTTPSessionManager, POST, id, URLString, parameters, id, parameters, progress, id, progress, success, id, success, failure, id, failure){
    
    NSLog(@"AFHTTPSessionManager  URLString:%@   parameters:%@", URLString, parameters);
    
    return CHSuper5(AFHTTPSessionManager, POST, URLString, parameters, parameters, progress, progress, success, success, failure, failure);
}

CHDeclareClass(NetEngineHelper)
CHMethod5(id, NetEngineHelper, requestWithMethod, long long, arg1, URLString, id, arg2, parameters, id, arg3, success, id, arg4, failure, id, arg5){
    
    NSLog(@"NetEngineHelper  requestWithMethod:%@  urlString:%@  parameters:%@", @(arg1), arg2, arg3);
    return CHSuper5(NetEngineHelper, requestWithMethod, arg1, URLString, arg2, parameters, arg3, success, arg4, failure, arg5);
}

CHDeclareClass(BasePublicParameModel)
CHMethod1(id, BasePublicParameModel, sortStringArray, id, arg1){
    id result = CHSuper1(BasePublicParameModel, sortStringArray, arg1);
    NSLog(@"BasePublicParameModel sortStringArray:%@  result:%@", arg1, result);
    return result;
}
CHMethod1(id, BasePublicParameModel, signNetParam, id, arg1){
    id result = CHSuper1(BasePublicParameModel, signNetParam, arg1);
    NSLog(@"BasePublicParameModel signNetParam:%@  result:%@", arg1, result);
    return result;
}
CHMethod0(id, BasePublicParameModel, getSignedKey){
    id result = CHSuper0(BasePublicParameModel, getSignedKey);
    NSLog(@"BasePublicParameModel  getSignedKey  result:%@", result);
    return result;
}

CHDeclareClass(MD5Tool)
CHClassMethod1(id, MD5Tool, MD5ForUpper32Bate, id, arg1){
    id result = CHSuper1(MD5Tool, MD5ForUpper32Bate, arg1);
    NSLog(@"MD5Tool MD5ForUpper32Bate  arg1:%@  result:%@", arg1, result);
    return result;
}


@class AFHTTPSessionManager;

CHConstructor{
    
    CHLoadLateClass(AFHTTPSessionManager);
    CHHook5(AFHTTPSessionManager, POST, parameters, progress, success, failure);
    
    CHLoadLateClass(NetEngineHelper);
    CHHook5(NetEngineHelper, requestWithMethod, URLString, parameters, success, failure);
    
    CHLoadLateClass(BasePublicParameModel);
    CHHook1(BasePublicParameModel, sortStringArray);
    CHHook1(BasePublicParameModel, signNetParam);
    CHHook0(BasePublicParameModel, getSignedKey);
    
    CHLoadLateClass(MD5Tool);
    CHClassHook1(MD5Tool, MD5ForUpper32Bate);
    
    
//    [[EncryptHooker sharedInstance] logMethod];
    
}

