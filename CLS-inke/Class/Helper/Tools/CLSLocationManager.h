//
//  CLSLocationManager.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LocationBlock)(NSString *lat,NSString *lon);
@interface CLSLocationManager : NSObject

+ (instancetype)sharedManager;

- (void)getGps:(LocationBlock)locationBlokc;

@property (nonatomic,copy)NSString *lat;
@property (nonatomic,copy)NSString *lon;
@end
