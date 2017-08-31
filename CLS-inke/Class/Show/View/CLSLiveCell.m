//
//  CLSLiveCell.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/31.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSLiveCell.h"

@interface CLSLiveCell()
@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end
@implementation CLSLiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.headView.layer.cornerRadius = 25;
    self.headView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setLive:(CLSLive *)live{
    _live = live;
    [self.headView downloadImage:live.creator.portrait placeholder:@"default_room"];
    [self.bigImageView downloadImage:live.creator.portrait placeholder:@"default_room"];
    self.nameLabel.text = live.creator.nick;
    self.locationLabel.text = live.city;
    self.onlineLabel.text = [@(live.onlineUsers) stringValue];
}
@end
