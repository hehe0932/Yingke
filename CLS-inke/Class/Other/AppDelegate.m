//
//  AppDelegate.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "AppDelegate.h"
#import "CLSTabBarViewController.h"
#import "CLSLocationManager.h"
#import "CLSAdvertiseView.h"
#import "AppDelegate+CLSUMeng.h"
#import "CLSLoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化友盟
    [self setupUMeng];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    CLSTabBarViewController *baseVC = [[CLSTabBarViewController alloc]init];
    CLSLoginViewController *loginVC = [[CLSLoginViewController alloc]init];
//    self.window.rootViewController = loginVC;
    self.window.rootViewController = baseVC;
    [self.window makeKeyAndVisible];
    [[CLSLocationManager sharedManager]getGps:^(NSString *lat, NSString *lon) {
        
    }];
    
    CLSAdvertiseView * advertiseView = [CLSAdvertiseView loadAdvertiseView];
    [self.window addSubview:advertiseView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
