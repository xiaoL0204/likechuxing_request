//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  LikechuxingDylib.h
//  LikechuxingDylib
//
//  Created by xiaolin on 2018/6/13.
//  Copyright (c) 2018年 xiaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define INSERT_SUCCESS_WELCOME @"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍"

@interface CustomViewController




- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

- (id)requestWithMethod:(long long)arg1 URLString:(id)arg2 parameters:(id)arg3 success:(id)arg4 failure:(id)arg5;

- (id _Nullable )sortStringArray:(id _Nullable )arg1;
- (id _Nullable )signNetParam:(id _Nullable )arg1;
- (id _Nullable )getSignedKey;

+ (id)MD5ForUpper32Bate:(id)arg1;

- (id)requestWithMethod:(id)method URLString:(id)URLString parameters:(id)parameters error:(NSError * _Nullable __autoreleasing *_Nullable)error;

@end
