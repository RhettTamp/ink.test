//
//  CTPTabBarViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPTabBarViewController.h"
#import "CTPTabBar.h"
#import "CTPBaseNavViewController.h"
#import "CTPLaunchViewController.h"


@interface CTPTabBarViewController ()<CTPTabBarDelegate>

@property (nonatomic,strong) CTPTabBar *ctpTabbar;

@end

@implementation CTPTabBarViewController

-(CTPTabBar *)ctpTabbar{
    if (!_ctpTabbar) {
        _ctpTabbar = [[CTPTabBar alloc]initWithFrame:CGRectMake(0, 0, CTPSCREEN_WIDTH, 49)];
        _ctpTabbar.delegate = self;
    }
    return _ctpTabbar;
}

- (void)tabbar:(CTPTabBar *)tabbar clickButton:(CTPItemType)idx{
    if (idx != CTPItemTypeLauch) {
        self.selectedIndex = idx - CTPItemTypeLive;
        return;
    }
    
    CTPLaunchViewController *launchVC = [[CTPLaunchViewController alloc]init];
    [self presentViewController:launchVC animated:YES completion:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self configViewControllers];
    [self.tabBar addSubview:self.ctpTabbar];
    
    //解决tabbar的阴影线
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

-(void)configViewControllers{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"CTPMainViewController",@"CTPMeInfoViewController"]];
    for (NSInteger i = 0; i < array.count; i++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        
        CTPBaseNavViewController *nav = [[CTPBaseNavViewController alloc]initWithRootViewController:vc];
        [array replaceObjectAtIndex:i withObject:nav];
        
    }
    self.viewControllers = array;
}


@end
