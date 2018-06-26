//
//  ViewController.m
//  LikechuxingSign
//
//  Created by xiaolin on 2018/6/13.
//  Copyright © 2018年 xiaolin. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     channel=AppStoreKcity_id=199Kcity_name=深圳市Kclient_time=1528877804.790816Kdevice_name=iPhone5sKuser_lat=22.540740Kuser_lng=113.932947Kuser_sys_version=10.0.2Kuser_version=ios_2108Kkey=
     
     result:DA6A660AFF1B92E902DB1363FF5A1895
     */
    NSDictionary *dic = @{@"channel": @"AppStore", @"city_id": @"199", @"city_name": @"深圳市", @"client_time": @"1528877804.790816", @"device_name": @"iPhone5s", @"sign": @"", @"token": @"", @"user_lat": @"22.540740", @"user_lng": @"113.932947", @"user_sys_version": @"10.0.2", @"user_version": @"ios_2108", @"uuid": @""};
    
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSLog(@"time:%@", @(time));
    
    
    NSArray* keys = [dic allKeys];
    NSArray* sortArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:(NSCaseInsensitiveSearch)];
    }];
    
    NSLog(@"sortArray:%@", sortArray);

    NSString* argumentString = @"";
    for (NSString* categoryId in sortArray)
    {
        NSString *value = [dic objectForKey:categoryId];
        if (value && ![value isEqualToString:@""]) {
             argumentString = [argumentString stringByAppendingString:[NSString stringWithFormat:@"%@=%@K",categoryId, value]];
        }
    }
#error 额外的key
    NSString *signedkey = @"";
    argumentString = [argumentString stringByAppendingString:[NSString stringWithFormat:@"%@=%@",@"key", signedkey]];
    
    NSLog(@"before sign:%@", argumentString);
    NSString *signedStr = [self getMd5String:argumentString];
    NSLog(@"after sign:%@", signedStr);
    
    
}


- (NSString *)getMd5String:(NSString *)str
{
    const char *string = str.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02X", bytes[i]];
    return [NSString stringWithString:mutableString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
