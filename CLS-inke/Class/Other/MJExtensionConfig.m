//
//  MJExtensionConfig.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "CLSCreator.h"
#import "CLSLive.h"
@implementation MJExtensionConfig
+ (void)load{
    
    //如果使用NSObject来调用这些方法,代表所有继承自NSObject的类都会生效
    //NSObject中的ID属性对应着字典的id
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID":@"id"
                 };
    }];
    
    [CLSCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc":@"description"
                 };
    }];
    
    //驼峰转下划线
    [CLSCreator mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [CLSLive mj_setupReplacedKeyFromPropertyName121:^id(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}
@end
