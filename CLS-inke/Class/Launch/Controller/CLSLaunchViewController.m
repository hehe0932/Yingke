//
//  CLSLaunchViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSLaunchViewController.h"
#import "LFLivePreview.h"
@interface CLSLaunchViewController ()
@property (nonatomic,strong)LFLivePreview *preview;
@end

@implementation CLSLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)starLive:(id)sender {
    UIView *backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backView];
    
    self.preview = [[LFLivePreview alloc] initWithFrame:self.view.bounds];
    self.preview.vc = self;
    [self.preview startLive];
    [self.view addSubview:self.preview];
    
}
- (IBAction)closeLaunch:(id)sender {
    
    [self.preview stopLive];
    [self dismissViewControllerAnimated:YES completion:nil];
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
