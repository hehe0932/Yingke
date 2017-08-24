//
//  CLSTabBarViewController.m
//  CLS-inke
//
//  Created by chenlishuang on 2017/8/24.
//  Copyright © 2017年 chenlishuang. All rights reserved.
//

#import "CLSTabBarViewController.h"
#import "CLSTabBar.h"
#import "CLSBaseNavigationController.h"
#import "CLSLaunchViewController.h"
@interface CLSTabBarViewController ()<CLSTabBarDelegate>
/** */
@property (nonatomic,strong)CLSTabBar *clsTabbar;
@end

@implementation CLSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载控制器
    [self configViewControllers];
    
    //加载tabbar
    [self.tabBar addSubview:self.clsTabbar];
    //删除tabbar的阴影线
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}
- (void)configViewControllers{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"CLSMainViewController",@"CLSMeViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        CLSBaseNavigationController *nav = [[CLSBaseNavigationController alloc]initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}
- (void)tabbar:(CLSTabBar *)tabbar clickButton:(LCSItemType)index{
    
    if (index != LCSItemTypeLaunch) {
        
        self.selectedIndex = index - LCSItemTypeLive;
        return;
    }
    
    CLSLaunchViewController *launchVC = [[CLSLaunchViewController alloc]init];
    [self presentViewController:launchVC animated:YES completion:nil];
}
- (CLSTabBar *)clsTabbar{
    if (!_clsTabbar) {
        _clsTabbar = [[CLSTabBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _clsTabbar.delegate = self;
    }
    return _clsTabbar;
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
