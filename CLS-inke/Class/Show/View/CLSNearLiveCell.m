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
@end
