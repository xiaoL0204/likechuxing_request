//
//  EncryptHooker.m
//  ToGoProjectInjectDylib
//
//  Created by xiaolin on 2018/5/15.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import "EncryptHooker.h"
#import "ANYMethodLog.h"
#import "CaptainHook.h"

//__attribute__((constructor)) static void entry() {
//    [[EncryptHooker sharedInstance] injectToolsTo];
//}




@interface EncryptHooker()
@property (nonatomic, strong) NSArray *whiteList;
@end

@implementation EncryptHooker

+ (instancetype)sharedInstance {
    static EncryptHooker *instance;
    if (!instance) {
        instance = [[EncryptHooker alloc] init];
    }
    return instance;
}

- (void)injectToolsTo{
    
    
}
  
- (void)logMethod {
    [ANYMethodLog logMethodWithClass:[NSClassFromString(@"BasePublicParameModel") class] condition:^BOOL(SEL sel) {
        NSString *selString = NSStringFromSelector(sel);
        NSLog(@"BasePublicParameModel selString:%@", selString);
        
        return YES;
    } before:^(id target, SEL sel, NSArray *args, int deep) {
        // 方法调用前
        NSLog(@"BasePublicParameModel -----BF<%d>----- sel:%@ args:%@", deep, NSStringFromSelector(sel),args);
    } after:^(id target, SEL sel, NSArray *args, NSTimeInterval interval, int deep, id retValue) {
        // 方法调用后
        NSLog(@"BasePublicParameModel -----AF<%d>----- sel:%@ args:%@ retValue:%@", deep, NSStringFromSelector(sel),args, retValue);
    }];
    
    
    
}



@end
