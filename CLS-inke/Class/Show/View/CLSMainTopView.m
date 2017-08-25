//
//  CLSMainTopView.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/25.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSMainTopView.h"

@interface CLSMainTopView()
/** 线*/
@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)NSMutableArray *buttons;
@end
@implementation CLSMainTopView

- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat buttonW = self.width/titles.count;
        CGFloat buttonH = self.height;
        for (NSInteger i = 0; i < titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *vcName = titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            titleBtn.frame = CGRectMake(i * buttonW , 0, buttonW, buttonH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            titleBtn.tag = i;
            [self addSubview:titleBtn];
            [self.buttons addObject:titleBtn];
            if (i == 1) {
                
                CGFloat h = 2;
                CGFloat y = 40;
                
                [titleBtn.titleLabel sizeToFit];
                
                self.lineView = [[UIView alloc]init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}
- (void)titleClick:(UIButton *)button{
    
    self.block(button.tag);
    
    [self scrolling:button.tag];
    
}
//外界mainvc滚动时调用
- (void)scrolling:(NSInteger )tag{
    
    UIButton *button = self.buttons[tag];
    [UIView animateWithDuration:0.2 animations:^{
        
        self.lineView.centerX = button.centerX;
        
    }];
}
@end
