//
//  EncryptHooker.h
//  ToGoProjectInjectDylib
//
//  Created by xiaolin on 2018/5/15.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptHooker : NSObject
+ (instancetype)sharedInstance;

- (void)injectToolsTo;
- (void)logMethod;



@end
