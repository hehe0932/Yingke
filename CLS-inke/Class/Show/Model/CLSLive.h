//
//  CLSLive.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLSCreator.h"
//@class CLSCreator;
@interface CLSLive : NSObject
//@property (nonatomic, strong) ActInfo * actInfo;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) CLSCreator * creator;
//@property (nonatomic, strong) Extra * extra;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger landscape;
@property (nonatomic, strong) NSArray * like;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, strong) NSString * liveType;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger tagId;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) NSInteger version;

@property (nonatomic, copy) NSString * distance;
@end
