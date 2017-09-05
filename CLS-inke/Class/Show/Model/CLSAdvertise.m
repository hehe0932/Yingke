//
//  CLSAdvertise.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/4.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSAdvertise.h"

@implementation CLSAdvertise
- (NSString *)description{
    return [NSString stringWithFormat:@"image=%@ atom=%@ link=%@",_image,_atom,_link];
}
@end
