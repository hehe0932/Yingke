//
//  CLSFocuseViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/25.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSFocuseViewController.h"
#import "CLSLiveHandler.h"
#import "CLSLiveCell.h"
//#import <MediaPlayer/MediaPlayer.h>
#import "CLSPlayerViewController.h"
static NSString *identifier = @"CLSLiveCell";
@interface CLSFocuseViewController ()
/** 数据源*/
@property (nonatomic,strong)NSArray *dataList;
@end

@implementation CLSFocuseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    
    [self loadData];
}

- (void)initUI {
    [self.tableView registerNib:[UINib nibWithNibName:@"CLSLiveCell" bundle:nil] forCellReuseIdentifier:identifier];
}
- (void)loadData{
    CLSLive *live = [[CLSLive alloc]init];
    live.city = @"北京";
    live.onlineUsers = 100;
    live.streamAddr = Live_Hehe;
    CLSCreator *creator = [[CLSCreator alloc]init];
    live.creator = creator;
    creator.nick = @"我呵呵";
    creator.portrait = @"shuang";
    self.dataList = @[live];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CLSLiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CLSLiveCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.live = self.dataList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70 + SCREEN_WIDTH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CLSLive *live = self.dataList[indexPath.row];
    
    CLSPlayerViewController *playerVC = [[CLSPlayerViewController alloc]init];
    playerVC.live = live;
    //    playerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:playerVC animated:YES];
    
    //系统自带的播放器播放不了直播内容
    //    MPMoviePlayerViewController *movieVC = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:live.streamAddr]];
    //    [self presentViewController:movieVC animated:YES completion:nil];
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
