//
//  APIConfig.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIConfig : NSObject

//信息类服务器地址
#define SERVER_HOST @"http://service.ingkee.com"

//图片服务器地址
#define IMAGE_HOST @"http://img.meelive.cn/"


//热门直播
//#define API_HotLive @"api/live/gettop"
#define API_HotLive @"api/live/gettop?&gender=1&gps_info=116.329656%2C40.026516&loc_info=CN%2C%E5%8C%97%E4%BA%AC%E5%B8%82%2C%E5%8C%97%E4%BA%AC%E5%B8%82&is_new_user=1&count=5&interest=0&multiaddr=1&location=&lc=0000000000000069&cc=TG0001&cv=IK4.1.00_Iphone&proto=8&idfa=17885813-A746-4256-BA57-8337D88E52E0&idfv=AC1BFDB3-8F89-4C80-8EC9-FA784FA598D0&devi=32729d71684d615f6f3bb32ba7f7adee7c579f99&osversion=ios_10.300000&ua=iPhone6_2&imei=&imsi=&uid=563401548&sid=20VJSmLm1GlH3yjMRi0Ffw7mLJzPVVPOri0EZU9Cq4rgi2ImbJ6cO&conn=wifi&mtid=dfa9896f7ac409b6c41f6545ca583065&mtxid=a4dcbef28360&logid=208,226,233&s_sg=88abb05e4ffa4f85e8747692c2aecdbf&s_sc=100&s_st=1504079541HTTP/1.1"
//附近的人
#define API_NearLive @"api/live/near_recommend"//near_flow_old
//?uid=85149891&latitude=40.090562&longitude=116.413353

//广告地址
#define API_Advertise @"advertise/get"//ticker


//欢哥直播地址
#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"


@end
