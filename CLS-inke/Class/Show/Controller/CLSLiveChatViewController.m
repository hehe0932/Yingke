//
//  CLSLiveChatViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSLiveChatViewController.h"

@interface CLSLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *peopleCountLabel;

@end

@implementation CLSLiveChatViewController

- (void)setLive:(CLSLive *)live{
    _live = live;
    [self.iconView downloadImage:live.creator.portrait placeholder:@"default_room"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.iconView.layer.cornerRadius = 15;
    self.iconView.layer.masksToBounds = YES;
    
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        self.peopleCountLabel.text = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    } repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
