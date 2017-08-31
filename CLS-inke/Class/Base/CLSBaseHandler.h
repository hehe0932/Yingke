//
//  CLSBaseHandler.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/29.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 处理完成事件 */
typedef void(^CompleteBlock)();

typedef void(^SuccessBlock)(id obj);

typedef void(^FailedBlock)(NSError  *error);

@interface CLSBaseHandler : NSObject

@end
