//
//  CLSNearLiveCell.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSNearLiveCell.h"

@interface CLSNearLiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;


@end
@implementation CLSNearLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLive:(CLSLive *)live{
    _live = live;
    [self.headView downloadImage:live.creator.portrait placeholder:@"default_room"];
    self.distanceLabel.text = live.distance;
}

- (void)showAnimation{
    
    if (self.live.isShow == YES) {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.live.show = YES;
    }];
}
@end
