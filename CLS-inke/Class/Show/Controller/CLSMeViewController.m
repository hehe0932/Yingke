//
//  CLSMeViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/6.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSMeViewController.h"
#import "CLSMeInfoView.h"
#import "CLSSetting.h"
@interface CLSMeViewController ()
/** 头视图*/
@property (nonatomic,strong)CLSMeInfoView *meInfoView;
/** 数据源*/
@property (nonatomic,strong)NSArray *dataList;
@end

@implementation CLSMeViewController
- (CLSMeInfoView *)meInfoView{
    if (!_meInfoView) {
        _meInfoView = [CLSMeInfoView loadInfoView];
//        _meInfoView.frame = CGRectMake(0, 0, 0, SCREEN_Height * 0.4);
    }
    return _meInfoView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.tableView.tableHeaderView = self.meInfoView;
    self.tableView.rowHeight = 50;
    self.tableView.sectionFooterHeight = 0;
    [self loadData];
}

- (void)loadData {
    CLSSetting *set1 = [[CLSSetting alloc]init];
    set1.title = @"贡献排行榜";
    set1.subTitle = @"";
    set1.vcName = @"CLSGongViewController";
    
    CLSSetting *set2 = [[CLSSetting alloc]init];
    set2.title = @"收益";
    set2.subTitle = @"0 映票";
    set2.vcName = @"CLSShouViewController";
    
    CLSSetting *set3 = [[CLSSetting alloc]init];
    set3.title = @"账户";
    set3.subTitle = @"0 钻石";
    set3.vcName = @"CLSZhangViewController";
    
    CLSSetting *set4 = [[CLSSetting alloc]init];
    set4.title = @"等级";
    set4.subTitle = @"3级";
    set4.vcName = @"CLSDengViewController";
    
    CLSSetting *set5 = [[CLSSetting alloc]init];
    set5.title = @"设置";
    set5.subTitle = @"";
    set5.vcName = @"CLSSettingViewController";
    
    NSArray *array1 = @[set1,set2,set3];
    NSArray *array2 = @[set4];
    NSArray *array3 = @[set5];
    
    self.dataList = @[array1,array2,array3];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataList[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"asd"];
    CLSSetting *setting = self.dataList[indexPath.section][indexPath.row];
    cell.textLabel.text = setting.title;
    cell.detailTextLabel.text = setting.subTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.meInfoView;
    }else{
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return SCREEN_Height * 0.5;
    }
    return 5;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
