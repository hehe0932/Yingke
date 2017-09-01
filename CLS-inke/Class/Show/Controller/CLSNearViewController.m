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

static NSString *identifier = @"CLSNearLiveCell";
@interface CLSNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
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
@end
