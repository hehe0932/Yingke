//
//  AppDelegate+CLSUMeng.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/5.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "AppDelegate+CLSUMeng.h"
#import <UMSocialCore/UMSocialCore.h>

#define Social_APPKEY @"5723664c67e58e15060036a6"
#define WEIBO_APPKEY @"1393573563"
#define WEIBO_APPSECERT @"02b197ba908770784dcd5155d5b4988d"
//微博App Key:1393573563
//友盟App Key:5723664c67e58e15060036a6
@implementation AppDelegate (CLSUMeng)
- (void)setupUMeng{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:Social_APPKEY];
    
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:WEIBO_APPKEY  appSecret:WEIBO_APPSECERT redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
    

}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    
    return YES;
}
    
@end
