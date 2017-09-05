//
//  CLSAdvertiseView.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/4.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSAdvertiseView.h"
#import "CLSLiveHandler.h"
#import "CLSAdvertise.h"
#import "CLSCacheHelper.h"

static NSInteger showTime = 3;
@interface CLSAdvertiseView()
@property (weak, nonatomic) IBOutlet UIImageView *backView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (nonatomic,strong)dispatch_source_t timer;
@end
@implementation CLSAdvertiseView

+ (instancetype)loadAdvertiseView{
    return [[NSBundle mainBundle]loadNibNamed:@"CLSAdvertiseView" owner:nil options:nil].lastObject;
}
//从nib加载的view初始化方法
- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.frame = [UIScreen mainScreen].bounds;
    
    //展示广告
    [self showAD];
    //下载广告
    [self downAD];
    //倒计时
    [self starTimer];
}

- (void)showAD{
    
    NSString * filePath = [CLSCacheHelper getAdvertise];
    
    UIImage *lastCacheImage = [[SDWebImageManager sharedManager].imageCache imageFromCacheForKey:filePath];
    
    if (lastCacheImage) {
        self.backView.image = lastCacheImage;
    }else{
        self.hidden = YES;
    }
    
}

- (void)downAD{
    //获取最新广告数据
    [CLSLiveHandler executeGetAdvertiseTaskWithSuccess:^(id obj) {
        CLSAdvertise *ad = obj[0];
        NSString *imageUrl = ad.image;
        
        //SDWebImageAvoidAutoSetImage 下载完不给imageView赋值
        [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:imageUrl] options:SDWebImageAvoidAutoSetImage progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
            
            [CLSCacheHelper setAdvertise:ad.image];
            NSLog(@"图片下载成功");
        }];
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)starTimer{
    
    __block NSUInteger timeout = showTime + 1;
    //dispatch_source最优 不涉及runloop
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;//必须强引用
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1/*每几秒*/ * NSEC_PER_SEC, 0/*延迟*/ * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        if (timeout <= 0) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self dismiss];
            });
            
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.timeLabel.text = [NSString stringWithFormat:@"跳过 :%zd",timeout];
            });
            
            timeout -- ;
        }
        
    });
    dispatch_resume(timer);
}

- (void)dismiss{
    [UIView animateWithDuration:.5 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
@end
