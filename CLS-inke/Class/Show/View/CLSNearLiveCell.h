//
//  CLSNearLiveCell.h
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLSLive.h"
@interface CLSNearLiveCell : UICollectionViewCell

@property (nonatomic,strong)CLSLive *live;

- (void)showAnimation;
@end
