//
//  CLSTabBar.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLSTabBar;

typedef NS_ENUM(NSUInteger , LCSItemType) {
    LCSItemTypeLaunch = 10,//启动直播
    LCSItemTypeLive = 100,//展示直播
    LCSItemTypeMe,//我的
};

typedef void(^TabBlock)(CLSTabBar *tabbar,LCSItemType index);
@protocol CLSTabBarDelegate <NSObject>

- (void)tabbar:(CLSTabBar *)tabbar clickButton:(LCSItemType)index;

@end
@interface CLSTabBar : UIView
/** 代理 */
@property (nonatomic,weak) id<CLSTabBarDelegate> delegate;
/** Block */
@property (nonatomic,copy) TabBlock block;
@end
