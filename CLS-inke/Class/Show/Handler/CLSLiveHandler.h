//
//  CLSLiveHandler.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSBaseHandler.h"

@interface CLSLiveHandler : CLSBaseHandler

/**
 获取热门直播信息

 @param success success
 @param failed failed
 */
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 获取附近的直播

 @param success success
 @param failed failed
 */
+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;
@end
