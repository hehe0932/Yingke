//
//  CLSNearViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/9/1.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSNearViewController.h"
#import "CLSLiveHandler.h"
#import "CLSNearLiveCell.h"
#import "CLSPlayerViewController.h"
static NSString *identifier = @"CLSNearLiveCell";

#define kMargin  5
#define kItemWidth  100

@interface CLSNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
/** 数据源*/
@property (nonatomic,strong)NSArray *dataList;
@end

@implementation CLSNearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
    [self loadData];
    
}
- (void)initUI{
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"CLSNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
}

- (void)loadData{
    
    [CLSLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        
        self.dataList = obj;
        [self.collectionView reloadData];
        
    } failed:^(NSError *error) {
        
    }];
}

#pragma mark - 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CLSNearLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.live = self.dataList[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    CLSLive *live = self.dataList[indexPath.row];
    
    CLSPlayerViewController *playerVC = [[CLSPlayerViewController alloc]init];
    playerVC.live = live;
    //    playerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:playerVC animated:YES];

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger count = self.collectionView.width/kItemWidth;
    CGFloat etraWidth = (self.collectionView.width - kMargin * (count + 1))/count;
    
    return CGSizeMake(etraWidth, etraWidth + 20);
}
//cell将要显示时调用
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CLSNearLiveCell *c = (CLSNearLiveCell *)cell;
    
    [c showAnimation];
}
@end
