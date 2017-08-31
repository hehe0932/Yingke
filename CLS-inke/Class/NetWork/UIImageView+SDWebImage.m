//
//  UIImageView+SDWebImage.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "UIImageView+SDWebImage.h"
#import <UIImageView+WebCache.h>
@implementation UIImageView (SDWebImage)
- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    //SDWebImageRetryFailed下载不成功重新下载
    //SDWebImageLowPriority 优先级  Runloop/滑动时不加载图片
}

- (void)downloadImage:(NSString *)url placeholder:(NSString *)imageName success:(DownloadImageSuccessBlock)success failed:(DownloadImageFailedBlock)failed progress:(DownloadImageProgressBlock)progress{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:imageName] options:SDWebImageRetryFailed|SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        progress(receivedSize *1.0/expectedSize);
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (error) {
            
            failed(error);
            
        }else{
            
//            self.image = image;
            success(image);
        }
    }];
}
@end
