//
//  CLSMainTopView.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/25.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);
@interface CLSMainTopView : UIView

@property (nonatomic,copy) MainTopBlock block;
- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

- (void)scrolling:(NSInteger )tag;
@end
