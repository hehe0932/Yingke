//
//  CLSMeInfoView.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/6.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSMeInfoView.h"

@implementation CLSMeInfoView

+ (instancetype)loadInfoView{
    return [[[NSBundle mainBundle]loadNibNamed:@"CLSMeInfoView" owner:self options:nil]lastObject];
}

@end
