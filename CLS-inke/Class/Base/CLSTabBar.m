//
//  CLSTabBar.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSTabBar.h"

@interface CLSTabBar()

@property (nonatomic,strong)UIImageView *tabbgView;
/** 数据源*/
@property (nonatomic,strong)NSArray *dataList;
/** 上一个按钮*/
@property (nonatomic,strong)UIButton *lastItem;
/** 中间按钮*/
@property (nonatomic,strong)UIButton *cameraButton;
@end
@implementation CLSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tabbgView.backgroundColor = RGB(30, 30, 30);
        [self addSubview:self.tabbgView];
        //装载item
        for (NSInteger i = 0; i < self.dataList.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            //不让图片在高亮状态下自适应
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = LCSItemTypeLive + i;
            
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            [self addSubview:item];
        }
        //添加直播按钮
        [self addSubview:self.cameraButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.tabbgView.frame = self.bounds;
    CGFloat width = self.bounds.size.width/self.dataList.count;
    
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        UIView *btn = self.subviews[i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - LCSItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - 50);
}
- (void)clickItem:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
//    if (self.block) {
//        self.block(self, button.tag);
//    }
    !self.block?:self.block(self,button.tag);
    
    if (button.tag == LCSItemTypeLaunch) {
        return;
    }
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    //设置动画
    [UIView animateWithDuration:0.2 animations:^{
        //将button放大1.2倍
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //回复初始的状态
            button.transform = CGAffineTransformIdentity;
        }];
    }];
}
- (UIImageView *)tabbgView{
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}
- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

- (UIButton *)cameraButton{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton sizeToFit];
        _cameraButton.tag = LCSItemTypeLaunch;
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}
@end
