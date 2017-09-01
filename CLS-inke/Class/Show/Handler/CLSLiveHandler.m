//
//  CLSLiveHandler.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSLiveHandler.h"
#import "HttpTool.h"
#import "CLSLive.h"
#import "CLSLocationManager.h"
@implementation CLSLiveHandler
+ (void)executeGetHotLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{

    [HttpTool getWithPath:API_HotLive params:nil success:^(id json) {
//        NSLog(@"~~%@",json);
        if ([json[@"dm_error"] integerValue]) {
            failed(json[@"error_msg"]);
        }else{
            //如果返回信息正确
            //数据解析
            NSArray *lives = [CLSLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
        
    } failure:^(NSError *error) {
        
        failed(error);
        
    }];
}


+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed{
    
    CLSLocationManager *manager = [CLSLocationManager sharedManager];
    
    NSDictionary *params = @{@"uid":@"563401548",
                             @"latitude":manager.lat,
                             @"longitude":manager.lon};
    [HttpTool getWithPath:API_NearLive params:params success:^(id json) {
        
        if ([json[@"dm_error"] integerValue]) {
            failed(json[@"error_msg"]);
        }else{
            //如果返回信息正确
            //数据解析
            NSArray *lives = [CLSLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
        
    } failure:^(NSError *error) {
        
        failed(error);
        
    }];
}
@end
