//
//  HttpTool.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^HttpSuccessBlock)(id json);
typedef void(^HttpFailuerBlock)(NSError *error);
typedef void(^HttpDownloadProgressBlock)(CGFloat progress);
typedef void(^HttpUploadProgressBlock)(CGFloat progress);
@interface HttpTool : NSObject

/**
 get网络请求

 @param path url地址
 @param params url参数 NSDictionary类型
 @param success 请求成功 返回NSDictionary或NSArray
 @param failuer 请求失败 返回NSError
 */
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailuerBlock)failuer;

/**
 post网络请求
 
 @param path url地址
 @param params url参数 NSDictionary类型
 @param success 请求成功 返回NSDictionary或NSArray
 @param failuer 请求失败 返回NSError
 */
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailuerBlock)failuer;

/**
 下载图片

 @param path url地址
 @param params url参数
 @param success 下载成功
 @param failuer 下载失败
 @param progress 下载进度
 */
+ (void)downloadWithPath:(NSString *)path
                  params:(NSDictionary *)params
                 success:(HttpSuccessBlock)success
                 failure:(HttpFailuerBlock)failuer
                progress:(HttpDownloadProgressBlock)progress;

/**
 上传图片

 @param path url地址
 @param params 上传参数
 @param imageKey imageKey
 @param image UIImage对象
 @param success 上传成功
 @param failuer 上传失败
 @param progress 上传进度
 */
+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                  thumbName:(NSString *)imageKey
                      image:(UIImage *)image
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailuerBlock)failuer
                   progress:(HttpDownloadProgressBlock)progress;
@end
