//
//  CLSMainViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSMainViewController.h"
#import "CLSMainTopView.h"
@interface CLSMainViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
/** title*/
@property (nonatomic,strong)NSArray *dataList;

@property (nonatomic,strong)CLSMainTopView *topView;
@end

@implementation CLSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}

- (void)initUI {
    //添加左右按钮
    [self setupNaV];
    
    //添加子视图控制器
    [self setupChildControllers];
    
}
- (void)setupNaV{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.titleView = self.topView;
}

- (void)setupChildControllers{
    
    NSArray *vcNames = @[@"CLSFocuseViewController",@"CLSHotViewController",@"CLSNearViewController"];
    
    for (NSInteger i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        
        vc.title = self.dataList[i];
        //当执行这句话时(addChildViewController) 不会执行vc的viewDidLoad
        [self addChildViewController:vc];
    }
    
    //将子控制器的View加到MainVC的scrollView上
    self.contentScrollView.delegate = self;
    //设置scrollView的contentSize
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * vcNames.count, 0);
    //默认先展示第二个界面
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    //进入主控制器加载第一个界面
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

//减速结束时调用加载子控制器view的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_Height;
    
    CGFloat offSet = scrollView.contentOffset.x;
    //获取索引值
    NSInteger index = offSet / width;
    
    [self.topView scrolling:index];
    
    //根据索引值 返回vc的引用
    UIViewController *vc = self.childViewControllers[index];
    
    //判断当前vc是否执行过viewDidLoad
    if ([vc isViewLoaded]) {
        return;
    }
    
    vc.view.frame = CGRectMake(offSet, 0, scrollView.bounds.size.width, height);
    
    [scrollView addSubview:vc.view];
}
//动画结束调用代理
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}
- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

- (CLSMainTopView *)topView{
    if (!_topView) {
        _topView = [[CLSMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataList];
        
//        __weak typeof(self) wSelf = self;
        @weakify(self);//YYKit
        _topView.block = ^(NSInteger tag){
            @strongify(self);
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
            
        };
    }
    return _topView;
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
