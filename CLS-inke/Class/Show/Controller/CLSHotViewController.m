//
//  CLSHotViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/25.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSHotViewController.h"
#import "CLSLiveHandler.h"
#import "CLSLiveCell.h"
//#import <MediaPlayer/MediaPlayer.h>
#import "CLSPlayerViewController.h"
static NSString *identifier = @"CLSLiveCell";
@interface CLSHotViewController ()
/** 数据源*/
@property (nonatomic,strong)NSMutableArray *dataList;
@end

@implementation CLSHotViewController

- (NSMutableArray *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
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
    [CLSLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {
        NSLog(@"%@",obj);
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
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
