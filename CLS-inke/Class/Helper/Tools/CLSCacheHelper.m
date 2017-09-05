//
//  CLSCacheHelper.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSCacheHelper.h"

#define advertiseImage @"advertiseImage"
@implementation CLSCacheHelper
+ (NSString *)getAdvertise{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:advertiseImage];
}

+ (void)setAdvertise:(NSString *)adImage{
    
    [[NSUserDefaults standardUserDefaults] setObject:adImage forKey:advertiseImage];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
@end
